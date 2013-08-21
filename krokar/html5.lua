-- 
--  Copyright (c) 2013, Kim Hermansson
--  All rights reserved.
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are met:
--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of Segfault Sourcery nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.
--  
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--  DISCLAIMED. IN NO EVENT SHALL Kim Hermansson BE LIABLE FOR ANY
--  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  

local doctypes = {}
doctypes['5'] = '<!DOCTYPE html>'
doctypes['html'] = '<!DOCTYPE html>'
doctypes['html5'] = '<!DOCTYPE html>'
doctypes['html 5'] = '<!DOCTYPE html>'
doctypes['html 4.01 strict'] = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">'
doctypes['html 4.01 transitional'] = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">'
doctypes['html 4.01 frameset'] = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">'
doctypes['xhtml 1.0 strict'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'
doctypes['xhtml 1.0 transitional'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
doctypes['xhtml 1.0 frameset'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">'
doctypes['xhtml 1.1'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'
doctypes['xml 1.0'] = '<?xml version="1.0"?>'
doctypes['xml 1.1'] = '<?xml version="1.1"?>'

-- Hook HTML tags and singletons

local format = string.format

local singletons = {'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'input', 'link', 'meta'}
for i=1, #singletons do
  hooks[singletons[i]] = function(attr, _) -- children are ignored
    return format("<%s%s />", singletons[i], attr)
  end
end

-- Compounds and syntactical sugar

hooks['raw-header'] = function(_, children)
  return table.concat(children, '\n') .. '\n\n'
end                 

hooks["utf-8"] = function(attr, children)
  -- Meta tag which declares we're using UTF-8
  return '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'
end

hooks["head"] = function(_, children)
  -- Let's assume we're always using utf-8
  return '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />' .. table.concat(children, '') .. '</head>'
end

hooks['img'] = function(attr, children)
  return format(
    "<img%s src='%s' alt='%s' />",
    attr or '',
    children[1] or '#',
    children[2] or '')
end

hooks['a'] = function(attr, children)
  local href = children[1]
  table.remove(children, 1)
  return format(
    "<a%s href='%s'>%s</a>",
    attr or '',
    href or '#',
    table.concat(children, '') or '')
end

hooks['css'] = function(attr, children)
  local insert = table.insert
  local format = string.format
  local styles = {}
  for i=1, #children do
    insert(styles, format('<link%s rel="stylesheet" type="text/css" href="%s" />', attr, children[i]))
  end
  return table.concat(styles, '')
end

hooks['js'] = function(_, children) -- attr is ignored
  local insert = table.insert
  local format = string.format
  local scripts = {}
  for i=1, #children do
    insert(scripts, format('<script type="text/javascript" src="%s"></script>', children[i]))
  end
  return table.concat(scripts, '')
end

hooks['doctype'] = function(_, children) -- attr is ignored
  return (doctypes[children[1]] or '<!-- unknown doctype: "'..children[1]..'" -->') .. '\n'
end


