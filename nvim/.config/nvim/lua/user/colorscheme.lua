vim.cmd[[colorscheme dracula]]

-- vim.cmd[[colorscheme tokyonight]]

-- local colorscheme = "gruvbox"
-- 
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- 
-- if not status_ok then
--         vim.notify("colorscheme" .. colorscheme .. "does not exist!")
-- end
-- 
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   overrides = {},
-- })

-- require('monokai').setup { palette = require('monokai').soda }

-- local colorscheme = "sonokai"
-- 
-- vim.g.sonokai_style = "andromeda"
-- 
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- 
-- if not status_ok then
--         vim.notify("colorscheme" .. colorscheme .. "does not exist!")
-- end

-- local c = require('vscode.colors')
-- require('vscode').setup({
--     -- Enable transparent background
--     transparent = true,
-- 
--     -- Enable italic comment
--     italic_comments = true,
-- 
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
-- 
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
-- 
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })

