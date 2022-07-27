local function setup(on_attach, capabilities)
	require("lspconfig").yamlls.setup({
		yaml = {
			schemaStore = {
				enable = true,
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	setup = setup,
}
