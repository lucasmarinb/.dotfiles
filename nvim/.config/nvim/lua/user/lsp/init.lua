-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Good dotfiles reference: https://github.com/jose-elias-alvarez/dotfiles/tree/main/config/nvim/lua/lsp

local lspconfig_status_ok, _ = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

-- ===== DIAGNOSTICS =====
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    -- width = 40,
  },
}

vim.diagnostic.config(config)

-- ===== HANDLERS =====
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  width = 60,
  -- height = 30,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  width = 60,
  -- height = 30,
})

-- ===== MASON: LSP INSTALLER =====
local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

-- ===== LANGUAGE SERVERS =====
local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

local default_settings = require("user.lsp.settings._template")
local function default_setup(server_name)
  default_settings.setup(server_name, on_attach, capabilities)
end

-- local servers = {
-- cssls = default_setup("cssls"),
-- cssmodules_ls = require("user.lsp.settings.cssmodules_ls").setup(on_attach, capabilities),
-- emmet_ls = require("user.lsp.settings.emmet_ls").setup(on_attach, capabilities),
-- html = default_setup("html"),
-- jsonls = require("user.lsp.settings.jsonls").setup(on_attach, capabilities),
-- sumneko_lua = require("user.lsp.settings.sumneko_lua").setup(on_attach, capabilities),
-- tsserver = require("user.lsp.settings.tsserver").setup(on_attach, capabilities),
-- pyright = require("user.lsp.settings.pyright").setup(on_attach, capabilities),
-- yamlls = require("user.lsp.settings.yamlls").setup(on_attach, capabilities),
-- bashls = default_setup("bashls"),
-- }

default_setup("cssls")
require("user.lsp.settings.cssmodules_ls").setup(on_attach, capabilities)
require("user.lsp.settings.emmet_ls").setup(on_attach, capabilities)
default_setup("html")
require("user.lsp.settings.jsonls").setup(on_attach, capabilities)
require("user.lsp.settings.sumneko_lua").setup(on_attach, capabilities)
require("user.lsp.settings.tsserver").setup(on_attach, capabilities)
require("user.lsp.settings.pyright").setup(on_attach, capabilities)
require("user.lsp.settings.yamlls").setup(on_attach, capabilities)
default_setup("bashls")
