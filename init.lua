require("pragyan.options")
require("pragyan.plugins")

require("pragyan.plug-configs")

vim.cmd("colorscheme materialOcean")

require("pragyan.lsp")
require("pragyan.keymaps")


-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    if (group ~=  '@lsp.type.function') then
        vim.api.nvim_set_hl(0, group, {})
    end
end

--- @param str string
--- @param substring string
--- @return boolean
local function starts_with(str, substring)
    return string.sub(str, 1, #substring) == substring
end

vim.api.nvim_set_hl(0, '@lsp.type.function', {
    fg = '#6695fa'
})

-- ignition files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.ign",
    command = "set filetype=json",
})


-- butane files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.bu",
    command = "set filetype=yaml",
})

-- lang.lua - Neovim syntax highlighting for .cy files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cy",
    command = "set filetype=lua",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.vert",
    command = "set filetype=glsl",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.frag",
    command = "set filetype=glsl",
})

-- vim.api.nvim_create_autocmd({"BufEnter"}, {
--     pattern = "*",
--     callback = function()
--         local current_buf = vim.fn.expand("%")
-- 
--         if vim.fn.isdirectory(current_buf) then
--             if starts_with(current_buf, "oil://") then
--                 current_buf = current_buf.sub(current_buf, 7)
--             end
-- 
--             vim.cmd.cd(current_buf)
--         end
--     end,
-- })

PrettyPrint = function (table)
    vim.print(table)
end
