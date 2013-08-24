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


hook('center-p', function(_, children)
  return '<p style="text-align: center">' .. table.concat(children, '') .. '</p>'
end)


hook('header', function(_, children)
  local title = table.remove(children, 1) or "title"
  local subtitle = table.concat(children, '')
  return '<div class="sixteen columns"><h1 class="remove-bottom" style="margin-top: 40px;">' .. title .. '</h1><h5>' .. subtitle .. '</h5><hr /></div>'
end)


hook('column', function(_, children)
  local title = anchor(table.remove(children, 1), "h3")
  return '<div class="sixteen columns">' .. title .. table.concat(children, '') .. '</div>'
end)


hook('column-half', function(_, children)
  local title = anchor(table.remove(children, 1), "h3")
  return '<div class="eight columns">' .. title .. table.concat(children, '') .. '</div>'
end)


hook('column-one-third', function(_, children)
  local title = anchor(table.remove(children, 1), "h3")
  return '<div class="one-third column">' .. title .. table.concat(children, '') .. '</div>'
end)


hook('column-two-thirds', function(_, children)
  local title = anchor(table.remove(children, 1), "h3")
  return '<div class="two-thirds column">' .. title .. table.concat(children, '') .. '</div>'
end)


hook('bullet-list', function(_, children)
  local list = #children > 0 and '<li>' .. table.concat(children, '</li><li>') .. '</li>' or ''
  return '<ul class="square">' .. list .. '</ul>'
end)

