-- pandoc filter: turn the CITEZ<hex>Z / TCITEZ<hex>Z tokens written by prep_tex.js
-- into Word CITATION fields (inside citation content controls), and the BIBLIOGRAPHYZ
-- paragraph into a BIBLIOGRAPHY field. Word fills in the text when fields are updated.

local sdt_id = 1000

local function unhex(h)
  return (h:gsub('..', function(c) return string.char(tonumber(c, 16)) end))
end

local function xml_escape(s)
  return (s:gsub('&', '&amp;'):gsub('<', '&lt;'):gsub('>', '&gt;'))
end

local function field_runs(code, placeholder)
  return '<w:r><w:fldChar w:fldCharType="begin"/></w:r>'
    .. '<w:r><w:instrText xml:space="preserve"> ' .. xml_escape(code) .. ' </w:instrText></w:r>'
    .. '<w:r><w:fldChar w:fldCharType="separate"/></w:r>'
    .. '<w:r><w:t xml:space="preserve">' .. xml_escape(placeholder) .. '</w:t></w:r>'
    .. '<w:r><w:fldChar w:fldCharType="end"/></w:r>'
end

local function quote(s)
  return '"' .. s:gsub('"', "'") .. '"'
end

-- payload: one line per source, fields tag TAB prenote TAB postnote;
-- narrative = true suppresses the author (it is already in the text)
local function citation(payload, narrative)
  local parts, labels = {}, {}
  for item in (payload .. '\n'):gmatch('([^\n]*)\n') do
    local key, pre, post = item:match('^([^\t]*)\t([^\t]*)\t(.*)$')
    local p = key
    if pre ~= '' then p = p .. ' \\f ' .. quote(pre .. ' ') end
    if post ~= '' then p = p .. ' \\p ' .. quote(post) end
    if narrative then p = p .. ' \\n' end
    parts[#parts + 1] = p
    labels[#labels + 1] = key
  end
  local code = 'CITATION ' .. table.concat(parts, ' \\m ') .. ' \\l 2057'
  sdt_id = sdt_id + 1
  return pandoc.RawInline('openxml',
    '<w:sdt><w:sdtPr><w:id w:val="' .. sdt_id .. '"/><w:citation/></w:sdtPr><w:sdtContent>'
    .. field_runs(code, '(' .. table.concat(labels, '; ') .. ')')
    .. '</w:sdtContent></w:sdt>')
end

function Str(el)
  local pre, t, h, post = el.text:match('^(.-)(T?)CITEZ(%x+)Z(.*)$')
  if not h then return nil end
  local out = {}
  if pre ~= '' then out[#out + 1] = pandoc.Str(pre) end
  out[#out + 1] = citation(unhex(h), t == 'T')
  if post ~= '' then
    local more = Str(pandoc.Str(post))
    if more then for _, x in ipairs(more) do out[#out + 1] = x end
    else out[#out + 1] = pandoc.Str(post) end
  end
  return out
end

-- a paragraph opening with one of these marker words gets the Word style named
local markers = { AUTHORCHECKZ = 'Author Check', FIGCAPZ = 'Image Caption' }

function Para(el)
  local first = el.content[1]
  -- table and figure source notes get their own Word style ("Table Note")
  if first and first.t == 'Emph' and #first.content > 0 and first.content[1].t == 'Str'
     and (first.content[1].text == 'Sources:' or first.content[1].text == 'Source:' or first.content[1].text == 'Notes:') then
    return pandoc.Div({el}, {['custom-style'] = 'Table Note'})
  end
  if first and first.t == 'Str' and markers[first.text] then
    local style = markers[first.text]
    el.content:remove(1)
    if el.content[1] and el.content[1].t == 'Space' then el.content:remove(1) end
    return pandoc.Div({el}, {['custom-style'] = style})
  end
  if #el.content == 1 and first.t == 'Str' and first.text == 'BIBLIOGRAPHYZ' then
    return pandoc.RawBlock('openxml',
      '<w:sdt><w:sdtPr><w:id w:val="999"/><w:docPartObj><w:docPartGallery w:val="Bibliographies"/>'
      .. '<w:docPartUnique/></w:docPartObj></w:sdtPr><w:sdtContent>'
      .. '<w:p><w:pPr><w:pStyle w:val="Bibliography"/></w:pPr>'
      .. field_runs('BIBLIOGRAPHY \\l 2057', 'Bibliography') .. '</w:p>'
      .. '</w:sdtContent></w:sdt>')
  end
end
