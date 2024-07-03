local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- local visual_mode_opts = {}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap , as leader key
keymap("", ",,", ",", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap(
    "n",
    "<C-p>",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts
)
keymap("n", "<C-f>", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>tr", ":Telescope resume <CR>", opts)

keymap("n", "<leader>nf", ":NvimTreeFindFile <CR>", opts)

keymap("n", "<M-b>", ":NvimTreeToggle<CR>", opts)

-- go to previously edited buffer using ,e
keymap("n", "<leader>e", "<C-^>", opts)

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

-- close buffer with ctrl + x + x
keymap("n", "<C-x>x", ":bd<CR>", opts)

-- Resize windows with hjkl
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-]>", ":bnext<CR>", opts)
keymap("n", "<C-[>", ":bprevious<CR>", opts)

-- Move to next/previous git hunk
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)

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

-- SOME WEIRD REGISTER MANIPULATION FUCKERY
-- keymap("v", "p", '"_dP', opts)

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
keymap("t", "<C-K><C-K>", "<C-\\><C-N>", term_opts)

-- Visual and Visual Block --
-- surround with brackets
-- keymap("x", "(", ":s;\\%V.*\\%V;(&)<CR> | :noh <CR>", opts)
-- keymap("x", "[", ":s;\\%V.*\\%V;[&]<CR> | :noh <CR>", opts)
-- keymap("x", "{", ":s;\\%V.*\\%V;{&}<CR> | :noh <CR>", opts)
keymap("v", "(", ":s;\\%V.*\\%V;(&)<CR> | :noh <CR>", opts)
keymap("v", "[", ":s;\\%V.*\\%V;[&]<CR> | :noh <CR>", opts)
keymap("v", "{", ":s;\\%V.*\\%V;{&}<CR> | :noh <CR>", opts)
keymap("v", "`", ":s;\\%V.*\\%V;`&`<CR> | :noh <CR>", opts)

-- gF also follows line numbers
keymap("n", "gf", "gF", opts)

-- Auto comments with C + /
-- keymap("v", "<C-/>", ":s;^;// <CR>", visual_mode_opts)
--
function CommentCode()
    local filetype = vim.bo.filetype
    local comment_starter = "/"

    if filetype == "python" or filetype == "sh" then
        comment_starter = "#"
    elseif filetype == "lua" or filetype == "sql" then
        comment_starter = "--"
    end

    print(comment_starter)

    return comment_starter
end

-- keymap("v", "<C-/>", ":s;^;:v:lua.CommentCode() <CR> | :noh <CR>", opts)
-- keymap("n", "<C-b>", ":s;^;v:lua.CommentCode() <CR> | :noh <CR>", { noremap = true, silent = false })

vim.cmd([[ command JsFmt !prettier --write '%' --tab-width=4 ]])
vim.cmd([[ command RsFmt !rustfmt '%' ]])
vim.cmd([[ command GoFmt !golines -w '%' ]])
vim.cmd([[ command ClsAll :%bd | e# ]])
vim.cmd([[ command CppFmt !clang-format '%' -i -style="{BasedOnStyle: llvm, IndentWidth: 4}" ]])
vim.cmd([[ command SurroundCSVWithQuotes :s;,\([a-zA-Z0-9\.\-/\?:=]*\),;,'\1',;g ]])


vim.cmd([[ command ReactStylesFix :%s;<\([A-Z]\);<Styles.\1;g | %s;</\([A-Z]\);</Styles.\1;g ]])

-- vim.api.nvim_add_user_command("JsFmt", "<cmd> ! prettier --write %", {})
