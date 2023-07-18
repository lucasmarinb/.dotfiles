local settings = {
  Lua = {
    type = {
      -- weakUnionCheck = true,
      -- weakNilCheck = true,
      -- castNumberToInteger = true,
    },
    format = {
      enable = false,
    },
    hint = {
      enable = true,
      arrayIndex = "Enable", -- "Enable", "Auto", "Disable"
      await = true,
      paramName = "Disable", -- "All", "Literal", "Disable"
      paramType = false,
      semicolon = "All", -- "All", "SameLine", "Disable"
      setType = true,
    },
    -- spell = {"the"}
    runtime = {
      version = "LuaJIT",
      special = {
        reload = "require",
      },
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
        -- [vim.fn.datapath "config" .. "/lua"] = true,
      },
    },
    telemetry = {
      enable = false,
    },
  },
}

local function setup(on_attach, capabilities)
  require("lspconfig").lua_ls.setup({
    settings = settings,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return {
  setup = setup,
}
