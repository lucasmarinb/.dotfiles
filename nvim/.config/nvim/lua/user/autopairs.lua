local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
  -- Treesitter config
	check_ts = true,
	ts_config = { -- it will not add pairs inside of the specified treesitter nodes
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
  -- Pressing <Alt - e> in insert mode shows hits to put the next pair item
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
})

-- This makes cmp.nvim put parentheses when confirming selection
-- Now reloading modules causes to put an extra pair
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
