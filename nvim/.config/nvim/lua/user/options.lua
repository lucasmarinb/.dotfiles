-- :help options
-- ===== NOTES =====
-- - Appending \c to a search makes it case insensitive, and \C makes is sensitive.

local options = {
  scrolloff = 8, -- is one of my fav
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  tabstop = 2, -- insert 2 spaces for a tab
  softtabstop = 2, -- determines how many whitespaces the cursor moves on <Tab> and <BS>
  shiftwidth = 2, -- ammount of spaces inserted with commands in normal mode
  expandtab = true, -- causes spaces to be used instead of tabs
  smartindent = true, -- intelligently add indentation depending on where the cursor is
  termguicolors = true, -- expand the color options
  completeopt = { "menu", "menuone", "noselect" },
  updatetime = 1000, -- Make updates happen faster
  guifont = "monospace:h17", -- the font used in graphical neovim applications,
  fileencoding = "utf-8",
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  splitbelow = true, -- new split appears below instead of top
  splitright = true, -- new split appears right instead of left
  ignorecase = true, -- ignore case search by default
  smartcase = true, -- if search contains uppercase letter it turns into case sensitive search
  timeoutlen = 2000, -- time in milliseconds to wait for a mapped sequence to complete.
  -- fold
  -- foldmethod = "expr",
  foldcolumn = "1",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  colorcolumn = "80",
  -- wrap text at the end of the screen without inserting a linbreak
  wrap = true,
  linebreak = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
