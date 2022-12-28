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

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  filters = {
    -- custom = { ".git" },
  },
  update_focused_file = {
    enable = true,
    -- update_cwd = true,
  },
  -- sync_root_with_cwd = true, -- updates the tree root directory on DirChanged event
  select_prompts = true, -- necessary when using a UI prompt decorator such as dressing.nvim
  view = {
    mappings = {
      list = {
        { key = "h", cb = tree_cb("close_node") }, -- collapse folder
        { key = "v", cb = tree_cb("vsplit") }, -- open in new verticcal split
      },
    },
  },
})
