local function setup(on_attach, capabilities)
  require("lspconfig").marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return {
  setup = setup,
}
