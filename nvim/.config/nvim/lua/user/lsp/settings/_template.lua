local function setup(server_name, on_attach, capabilities)
	require("lspconfig")[server_name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	setup = setup,
}
