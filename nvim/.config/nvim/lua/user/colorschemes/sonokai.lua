-- Available values:   `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, 'espresso'
local colorscheme = "sonokai"

vim.g.sonokai_style = "atlantis"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. "does not exist!")
end
