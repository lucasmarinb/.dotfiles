-- https://github.com/pedro757/emmet
-- npm i -g ls_emmet
local function setup(on_attach, capabilities)
	require("lspconfig").emmet_ls.setup({})
end

return {
	setup = setup,
}
