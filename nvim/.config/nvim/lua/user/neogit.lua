local neogit_status_ok, neogit = pcall(require, "null-ls")
if not neogit_status_ok then
	return
end

neogit.setup()
