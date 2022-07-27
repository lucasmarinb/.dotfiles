local function setup(on_attach, capabilities)
	require("lspconfig").pyright.setup({
		cmd = { "py" },
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					diagnosticMode = "workspace",
					inlayHints = {
						variableTypes = true,
						functionReturnTypes = true,
					},
				},
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	setup = setup,
}
