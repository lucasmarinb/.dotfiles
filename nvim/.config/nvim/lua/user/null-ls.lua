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
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.eslint,
		code_actions.eslint,
		diagnostics.eslint,
    code_actions.gitsigns,
	},
})
