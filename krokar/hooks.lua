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

-- div class="row"
hook('row', function(_, children)
  title = table.remove(children, 1)
  return '<div class="row"><h3>' .. title .. '</h3>' .. table.concat(children, '') .. '</div>'
end)

hook('one-third-column', function(_, children)
  title = table.remove(children, 1)
  return '<div class="one-third column"><h3>' .. title .. '</h3>' .. table.concat(children, '') .. '</div>'
end)