-- ===== RTFM =====
-- :h key-notation

-- ===== NOTES =====
-- <C-f>: Edit command in comand line
-- <C-6>: Alternate files
-- :h cmdline-editing - To see how navigate the vim command line
-- For regex searches, every special operator has to be scaped, which is the opposite to normal regex, where the characters are scaped and not the operators.
-- :echo ft - Echoes the file type of the current buffer
-- *: searches for the next occurence for the word under the cursor
-- #: same as * but searches backwards
-- <C-r><C-w>: In search mode, searches the word under the cursor
-- <C-o>: Navigate to the previous item in the jumplist
-- <C-i>: Navigate to the next item in the jumplist

local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts) -- to prevent any previous mapping on the leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes normal_mode = "n", insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- acá tengo que revisar como se hace lo mismo con librería plenary, una referencia son las dotfiles de teej
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^user") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	print("Sourced init.lua")
end

function _G.toggleHls()
  local hls = vim.opt.hlsearch:get()
  local vhls = vim.v.hlsearch
  if (hls and vhls == 1) then
    return vim.cmd("nohls")
  else
    return vim.cmd("set hls")
  end
end

keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>p", '"_dP', opts) -- paste into null register to avoid to avoid messing other yanked elements
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>o", "o<Esc>", opts)
keymap("n", "<leader>O", "O<Esc>", opts)
keymap("n", "<C-l>", "<Cmd>lua toggleHls()<CR>", opts)
keymap("n", "<leader>/", "<Cmd>:set hls<CR>", opts)
keymap("n", "<leader>?", "<Cmd>:nohls<CR>", opts)
-- keymap("n", "<leader>so", "<Cmd>lua ReloadConfig()<CR>", { noremap = true })

-- Telescope
keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quickfix list
keymap("n", "<leader>qq", "<Cmd>:cclose<CR>", opts)
keymap("n", "<leader>qo", "<Cmd>:copen<CR>", opts)
keymap("n", "[q", "<Cmd>:cprev<CR>", opts)
keymap("n", "]q", "<Cmd>:cnext<CR>", opts)

-- Harpoon
keymap("n", "<leader>ma", "<Cmd>lua require(\"harpoon.mark\").add_file()<CR>", opts)
keymap("n", "<leader>mf", "<Cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", opts)
keymap("n", "[m", "<Cmd>lua require(\"harpoon.ui\").nav_prev()<CR>", opts)
keymap("n", "]m", "<Cmd>lua require(\"harpoon.ui\").nav_next()<CR>", opts)
keymap("n", "<leader>1", "<Cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>", opts)
keymap("n", "<leader>2", "<Cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>", opts)
keymap("n", "<leader>3", "<Cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>", opts)
keymap("n", "<leader>4", "<Cmd>lua require(\"harpoon.ui\").nav_file(4)<CR>", opts)

-- ===== Visual =====
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<leader>y", '"+y', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>gv-gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<a-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<a-k>", ":move '<-2<CR>gv-gv", opts)
