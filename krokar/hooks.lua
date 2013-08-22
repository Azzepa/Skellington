local function escapehtml(data)
  local gsub = string.gsub
  data = gsub(data, '&', '&amp;')
  data = gsub(data, '"', '&quot;')
  data = gsub(data, '%$', '&#36;')
  data = gsub(data, '<', '&lt;')
  data = gsub(data, '>', '&gt;')
  return data
end

hook('load-code', function(_, children)
  local out = {}
  local insert = table.insert
  for _, path in ipairs(children) do
    local file = assert(io.open(path, 'r'))
    local data = file:read('*all')
    file:close()
    insert(out, '<pre class="prettyprint">' .. escapehtml(data) .. '</pre>')
  end
  return table.concat(out, "<br />")
end)

-- TODO: We'll need some hooks around the various divs you can make in Skeleton


local function anchor(title, tag)
  local tag = tag or "h3"
  local name = title:gsub('[^%w]+', ''):lower()
  return ('<a name="%s"><%s>%s</%s></a>'):format(name, tag, title, tag)
end

-- div class="row"
hook('row', function(_, children)
  title = anchor(table.remove(children, 1), "h3")
  return '<div class="row">' .. title .. table.concat(children, '') .. '</div>'
end)

hook('one-half-column', function(_, children)
  title = anchor(table.remove(children, 1), "h3")
  
  -- The stylesheet apparently "divides" containers into up to 16 equal columns,
  -- where 16 covers the entire width. What we think of by half would then be 8.
  
  return '<div class="eight columns">' .. title .. table.concat(children, '') .. '</div>'
end)

hook('one-third-column', function(_, children)
  title = anchor(table.remove(children, 1), "h3")
  return '<div class="one-third column">' .. title .. table.concat(children, '') .. '</div>'
end)

hook('center-p', function(_, children)
  return '<p style="text-align: center">' .. table.concat(children, '') .. '<div>'
end)