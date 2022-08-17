-- ===== RTFM =====
-- :h telescope.setup()
-- :h telescope.builtins()
-- Available pickers: https://github.com/nvim-telescope/telescope.nvim#pickers

-- ===== CHEATSHEET =====
-- <C-c>: Close telescope
-- <Esc>: Close telescope in normal mode
-- <C-v>: Go to selection in a vsplit
-- <C-p>: Previous item
-- <C-n>: Next item
-- <k>: Previous item in normal mode
-- <j>: Next item in normal mode
-- <C-u>: Scroll up preview
-- <C-d>: Scroll down preview
-- <C-q>: Send all not filtered items to quickfixlist
-- <M-q>: Send all selected items to quickfixlist

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", ".next" },
  },
  pickers = {
    find_files = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
  },
})
-- vim.api.nvim_create_augroup("User", {})
vim.api.nvim_create_autocmd({ "User TelescopePreviewerLoaded" }, { command = "setlocal wrap" })