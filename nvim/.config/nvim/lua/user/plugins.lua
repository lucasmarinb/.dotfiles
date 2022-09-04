local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself

  -- Colorschemes
  use("sainnhe/sonokai")
  use("Mofiqul/vscode.nvim")
  use("tanvirtin/monokai.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("folke/tokyonight.nvim")
  use("Mofiqul/dracula.nvim")
  use("JoosepAlviste/palenightfall.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion engine plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in language server client
  use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua api
  use("hrsh7th/cmp-emoji")

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP (LSP is integrated in nvim, this just enables an easy way to config)
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("b0o/SchemaStore.nvim") -- repo of document schemas like package.json
  use("onsails/lspkind.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/typescript.nvim")

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("p00f/nvim-ts-rainbow")
  use("windwp/nvim-autopairs")
  use("nvim-treesitter/nvim-treesitter-context")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine

  -- Git
  use("TimUntersberger/neogit")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")
  use("akinsho/git-conflict.nvim")

  -- NvimTree
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Colors
  use("NvChad/nvim-colorizer.lua")

  -- Comments
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
  })

  -- Sessions
  --[[ use("rmagatti/auto-session")
  use("rmagatti/session-lens") ]]

  -- Uncategorized
  use("nvim-lua/plenary.nvim")
  use("nvim-lualine/lualine.nvim")
  use("RRethy/vim-illuminate")
  use("mg979/vim-visual-multi")
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })
  use("ThePrimeagen/harpoon")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
