require "markdown"

local template_path = '/assets/templates/'..ngx.var.template..'.tpl'
local markdown_path = '/'..ngx.var.file..'.md'

-- Generate html from the markdown file
local md       = ngx.location.capture(markdown_path).body
local content  = markdown(md)

-- Extract the title (first line of the markdown file)
local index = string.find(md, '\n')
local title = string.sub(md, 1, index)

-- Generate the html from the layout
local template = ngx.location.capture(template_path).body
local html = string.format(template, title, content)

ngx.print(html)

