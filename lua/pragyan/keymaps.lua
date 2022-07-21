local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-p>',":Files<CR>",opts)
keymap('n', '<M-b>',":NERDTreeToggle<CR>",opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- close buffer with ctrl + x + x
keymap("n", "<C-x>x", ":bd<CR>", opts)

-- Resize with arrows
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-]>", ":bnext<CR>", opts)
keymap("n", "<C-[>", ":bprevious<CR>", opts)

-- Better Saving files
keymap("n", "<C-s>", ":w <CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-M-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-M-k>", ":m .-2<CR>==", opts)
keymap("n", "<C-M-j>", ":m .+1<CR>==", opts)
keymap("n", "<C-M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- clear 
keymap("n", "<C-\\>", ":noh <CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "ll", "<C-\\><C-N>", term_opts)
