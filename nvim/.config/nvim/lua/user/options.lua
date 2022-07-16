-- :help options
local options = {
				scrolloff = 8,                           -- is one of my fav
				number = true,                           -- set numbered lines
				relativenumber = true,                   -- set relative numbered lines
				tabstop = 2,                             -- insert 2 spaces for a tab
				softtabstop = 2,                         -- determines how many whitespaces the cursor moves on <Tab> and <BS>
				shiftwidth = 2,                          -- ammount of spaces inserted with commands in normal mode
				expandtab = true,                        -- causes spaces to be used instead of tabs
				smartindent = true,                      -- intelligently add indentation depending on where the cursor is
}

for k, v in pairs(options) do
				vim.opt[k] = v
end
