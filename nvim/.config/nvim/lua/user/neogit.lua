-- d: Open diffview
-- ===== NOTES =====
-- Editing in the diffview tab actually changes the file

local neogit_status_ok, neogit = pcall(require, "neogit")
if not neogit_status_ok then
  return
end

neogit.setup({
  integrations = {
    diffview = true,
  },
})
