-- ===== RTFM =====
-- :h nvim-tree-setup - to see available config options
-- :h nvim-tree-mappings - to see available mappings

-- ===== CHEATSHEET =====
-- * r: rename
-- * R: reload
-- * a: create
-- * d: delete
-- * x: cut
-- * c: copy
-- * p: paste
-- * P: parent node
-- * W: collapse all
-- * I: toggle git ignored files
-- * H: toggle dotfiles
-- * <Tab>: open the file as a preview (keeps the cursor in the tree)
-- * q: quite

-- ===== NOTES =====
-- Changing case:
-- * ~: Toggle case of character
-- * g~<movement>: Toggle case <movement>, i.e `g~iw`.
-- * gu<movement>: Lowercase <movement>, i.e `guiw`.
-- * gU<movement>: Uppercase <movement>, i.e `gUiw`.

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "<C-o>", api.node.run.system, opts("System Open"))
end

nvim_tree.setup({
  filters = {
    -- custom = { ".git" },
  },
  prefer_startup_root = true,
  update_focused_file = {
    enable = true,
    -- update_cwd = true,
  },
  -- sync_root_with_cwd = true, -- updates the tree root directory on DirChanged event
  select_prompts = true, -- necessary when using a UI prompt decorator such as dressing.nvim
  on_attach = on_attach,
})
