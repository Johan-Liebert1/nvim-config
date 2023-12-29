require("pragyan.options")
require("pragyan.plugins")

require("pragyan.plug-configs")

require("pragyan.lsp")
require("pragyan.keymaps")

vim.cmd("colorscheme materialOcean")

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    if (group ~=  '@lsp.type.function') then
        vim.api.nvim_set_hl(0, group, {})
    end
end

vim.api.nvim_set_hl(0, '@lsp.type.function', {
    fg = '#6695fa'
})

-- lang.lua - Neovim syntax highlighting for .berk files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cberk",
    command = "set filetype=lua",
})
