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
  if hls and vhls == 1 then
    return vim.cmd("nohls")
  else
    return vim.cmd("set hls")
  end
end

-- ===== Plugins =====
-- Nvim-tree
keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

--Neogit
keymap("n", "<leader>gg", "<Cmd>Neogit<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files({ hidden=true, no_ignore=true })<CR>", opts)
keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep({ hidden=true, no_ignore=true })<CR>", opts)
keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers({ hidden=true, no_ignore=true })<CR>", opts)
keymap("n", "<leader>fd", "<Cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)

-- Harpoon
keymap("n", "<leader>ma", '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "<leader>mf", '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "[m", '<Cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
keymap("n", "]m", '<Cmd>lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "<leader>1", '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader>2", '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>3", '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader>4", '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- Illuminate
keymap("n", "]r", '<Cmd>lua require"illuminate".next_reference{wrap=true}<Cr>', { noremap = true })
keymap("n", "[r", '<Cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<Cr>', { noremap = true })

-- ===== Utilities =====
-- Clipboard
keymap("v", "p", '"_dP', opts) -- paste into null register to avoid to avoid messing other yanked elements

keymap("n", "y", '"+y', opts)
keymap("n", "Y", '"+Y', opts)
keymap("n", "d", '"+d', opts)
keymap("n", "D", '"+D', opts)

keymap("v", "y", '"+y', opts)
keymap("v", "Y", '"+Y', opts)

keymap("x", "y", '"+y', opts)
keymap("x", "Y", '"+Y', opts)

-- Quickfix list
keymap("n", "<leader>qq", "<Cmd>:cclose<CR>", opts)
keymap("n", "<leader>qo", "<Cmd>:copen<CR>", opts)
keymap("n", "[q", "<Cmd>:cprev<CR>", opts)
keymap("n", "]q", "<Cmd>:cnext<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "V:m .+1<CR>gv", opts)
keymap("n", "<A-k>", "V:m .-2<CR>gv", opts)
keymap("v", "<A-j>", ":m .+1<CR>gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Normal mode line breaks
keymap("n", "[<CR>", "O<Esc>", opts)
keymap("n", "]<CR>", "o<Esc>", opts)

-- Highlight
keymap("n", "<C-l>", "<Cmd>lua toggleHls()<CR>", opts)

-- Misc
keymap("n", "<C-z>", "<nop>", opts) -- avoid accidentally shutting down nvim
