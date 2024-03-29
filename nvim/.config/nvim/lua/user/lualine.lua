require("lualine").setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = "[+]", -- Text to show when the file is modified.
          readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "[No Name]", -- Text to show for unnamed buffers.
        },
      },
    },
  },
  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {
  --     {
  --       "filename",
  --       file_status = true, -- Displays file status (readonly status, modified status)
  --       path = 1, -- 0: Just the filename
  --       -- 1: Relative path
  --       -- 2: Absolute path
  --       -- 3: Absolute path, with tilde as the home directory
  --
  --       shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  --       -- for other components. (terrible name, any suggestions?)
  --       symbols = {
  --         modified = "[+]", -- Text to show when the file is modified.
  --         readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
  --         unnamed = "[No Name]", -- Text to show for unnamed buffers.
  --       },
  --     },
  --   },
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  -- tabline = {
  --   lualine_a = { "buffers" },
  --   -- lualine_b = { "branch" },
  --   -- lualine_c = { "filename" },
  --   -- lualine_x = {},
  --   -- lualine_y = {},
  --   -- lualine_z = { "tabs" },
  -- },
})
