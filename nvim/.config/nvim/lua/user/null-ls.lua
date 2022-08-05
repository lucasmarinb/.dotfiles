-- Options: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#options
-- Builtin sources: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = true,
  sources = {
    formatting.stylua,
    formatting.prettierd,
    -- formatting.eslint_d,
    code_actions.eslint_d,
    diagnostics.eslint_d,
    code_actions.gitsigns,
  },
})
