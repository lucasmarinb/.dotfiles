local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
	return
end

local function setup(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		init_options = {
			provideFormatter = false,
		},
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	setup = setup,
}
