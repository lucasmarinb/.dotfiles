local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

configs.setup {
  ensure_installed = "all", -- one of "all" or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    -- use_languagetree = true,
    enable = true, -- false will disable the whole extension
    -- disable = { "css", "html" }, -- list of language that will be disabled
    -- disable = { "css", "markdown" }, -- list of language that will be disabled
    disable = { "markdown" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = { enable = true, disable = { "python", "css", "rust" } },
  -- treesitter plugins
  rainbow = {
    enable = true,
    disable = { "html" },
    -- It allows up to 7 colors, put one more and break the program
    colors = {
      -- d3.schemePastel1
      -- "#fbb4ae",
      -- "#b3cde3",
      -- "#ccebc5",
      -- "#decbe4",
      -- "#fed9a6",
      -- "#ffffcc",
      -- "#e5d8bd",
      -- "#fddaec",
      -- "#f2f2f2",
      -- d3.schemeSet1
      "#f28e2c",
      "#4e79a7",
      "#edc949",
      "#76b7b2",
      "#e15759",
      "#59a14f",
      "#af7aa1",
      -- "#ff9da7",
      -- "#9c755f",
      -- "#bab0ab",
    },
  },
}
