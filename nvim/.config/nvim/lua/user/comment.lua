local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  return
end
comment.setup({
  pre_hook = function(ctx)
    return require("Comment.jsx").calculate(ctx)
  end,
})
