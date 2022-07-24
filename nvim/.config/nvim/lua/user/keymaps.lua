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
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>p", '"_dP', opts) -- paste into null register to avoid to avoid messing other yanked elements
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>so", '<Cmd>lua ReloadConfig()<CR>', { noremap = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
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
