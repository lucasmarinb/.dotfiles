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
-- <C-Down>: Cycle history next
-- <C-Up>: Cycle history prev

-- ===== COMMENTS =====
-- The plugin telescope-fzf-native.nvim was installed to allow spaces in a file search
-- The plugin required to compile the fzf plugin, I had to do it manually by running make in the plugin folder

local telescope = require("telescope")

telescope.load_extension("project")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/", ".next/" },
    mappings = {
      i = {
        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
  pickers = {
    find_files = {
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = { width = 0.5, prompt_position = "top" },
    },
    buffers = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    help_tags = { theme = "dropdown" },
    git_status = {
      initial_mode = "normal",
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" },
    },
    project = {
      initial_mode = "normal",
      sorting_strategy = "ascending",
      layout_config = { width = 0.5, prompt_position = "top" },
    },
  },
  extensions = {
    -- telescope-fzf-native.nvim config
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    },
    project = {
      sync_with_nvim_tree = true, -- default false
    },
  },
})
-- vim.api.nvim_create_augroup("User", {}) -- nunca supe por qué falló esto, pero tenía que ver con el text wrap

-- Enable text wrap in telescope preview
vim.api.nvim_create_autocmd({ "User TelescopePreviewerLoaded" }, { command = "setlocal wrap" })

-- telescope-fzf-native.nvim should be loaded somewhere after setup function:
require("telescope").load_extension("fzf")
