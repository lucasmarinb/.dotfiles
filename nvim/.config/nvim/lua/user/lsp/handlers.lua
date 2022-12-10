local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local eslint_disabled_buffers = {}
-- track buffers that eslint can't format to use prettier instead
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not (client and client.name == "eslint") then
    return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, config)
  end

  for _, diagnostic in ipairs(result.diagnostics) do
    if diagnostic.message:find("The file does not match your project config") then
      local bufnr = vim.uri_to_bufnr(result.uri)
      eslint_disabled_buffers[bufnr] = true
    end
  end

  return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, config)
end

local lsp_formatting = function(bufnr)
  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  local table = {
    some = function(tbl, cb)
      for k, v in pairs(tbl) do
        if cb(k, v) then
          return true
        end
      end
      return false
    end,
  }
  vim.lsp.buf.format({
    async = true,
    bufnr = bufnr,
    filter = function(client)
      if client.name == "eslint" then
        return not eslint_disabled_buffers[bufnr]
      end

      if client.name == "null-ls" then
        return not table.some(clients, function(_, other_client)
          return other_client.name == "eslint" and not eslint_disabled_buffers[bufnr]
        end)
      end
    end,
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
    lsp_formatting(bufnr)
  end, {})
  -- https://www.reddit.com/r/neovim/comments/u2rpnt/can_i_ask_neovim_to_apply_the_first_code_action/
  -- https://neovim.discourse.group/t/using-eslint-language-server-as-a-formatter-fix-all-eslint-errors/1966/7
  -- vim.api.nvim_buf_create_user_command(bufnr, "LspEslintFixAll", function()
  --   local params = {
  --     command = "eslint.applyAllFixes",
  --     arguments = {
  --       uri = vim.uri_from_bufnr(bufnr),
  --       version = vim.lsp.util.buf_versions[bufnr],
  --     },
  --   }
  --   local res = vim.lsp.buf_request_sync(0, "workspace/executeCommand", params)
  --   for key, value in pairs(res) do
  --     print(key, value)
  --   end
  -- end, {})
  -- vim.keymap.set("n", "<leader>fix", "<Cmd>LspEslintFixAll<CR>", opts)
  vim.keymap.set("n", "gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<M-f>", "<Cmd>LspFormatting<CR>", opts)
  vim.keymap.set("n", "<M-a>", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.keymap.set("n", "<M-s>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "<leader>f", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set("n", "[d", '<Cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "]d", '<Cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "<leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.keymap.set("n", "<leader>sy", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  -- enable format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      command = "LspFormatting",
    })
  end
end

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
