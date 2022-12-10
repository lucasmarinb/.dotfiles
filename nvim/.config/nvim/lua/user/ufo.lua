-- ===== NOTES =====
-- zc: Close foldable text object under cursor
-- zo: Open foldable text object under cursor
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
