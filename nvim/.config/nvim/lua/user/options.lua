-- :help options
local options = {
  scrolloff = 8,                                     -- is one of my fav
  number = true,                                     -- set numbered lines
  relativenumber = true,                             -- set relative numbered lines
  tabstop = 2,                                       -- insert 2 spaces for a tab
  softtabstop = 2,                                   -- determines how many whitespaces the cursor moves on <Tab> and <BS>
  shiftwidth = 2,                                    -- ammount of spaces inserted with commands in normal mode
  expandtab = true,                                  -- causes spaces to be used instead of tabs
  smartindent = true,                                -- intelligently add indentation depending on where the cursor is
  termguicolors = true,                              -- expand the color options
  completeopt = { "menu", "menuone", "noselect" },
  updatetime = 1000,                                 -- Make updates happen faster
  guifont = "monospace:h17",                         -- the font used in graphical neovim applications,
  fileencoding = "utf-8",
  signcolumn = "yes",                                -- always show the sign column, otherwise it would shift the text each time
  writebackup = false,                               -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

