local buf_map = function(bufnr, mode, target, source, opts)
	opts = opts or {}
	opts.buffer = bufnr
	opts.silent = true

	vim.keymap.set(mode, target, source, opts)
end

local function setup(on_attach, capabilities)
	require("typescript").setup({
		server = {
			on_attach = function(client, bufnr)
				buf_map(bufnr, "n", "gs", ":TypescriptRemoveUnused<CR>")
				buf_map(bufnr, "n", "gS", ":TypescriptOrganizeImports<CR>")
				buf_map(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>")
				buf_map(bufnr, "n", "gA", ":TypescriptFixAll<CR>")
				buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		},
	})
end

return {
	setup = setup,
}
