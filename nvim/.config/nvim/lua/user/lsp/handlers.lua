local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function lsp_highlight_document(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "document_highlight",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Clear All the References",
		})
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]) -- Al parecer esto se usa en el keymap <M-f>
	vim.keymap.set("n", "gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<M-f>", "<Cmd>Format<CR>", opts)
	vim.keymap.set("n", "<M-a>", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.keymap.set("n", "<M-s>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<leader>f", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- vim.keymap.set("n", "[d", '<Cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- vim.keymap.set("n", "]d", '<Cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- vim.keymap.set("n", "<leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client, bufnr)
end

return {
	on_attach = on_attach,
	capabilities = capabilities,
}
