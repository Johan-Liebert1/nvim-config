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

-- systemd service files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.service",
    command = "set filetype=systemd",
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

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if #vim.fn.argv() == 0 then
            return
        end

        local arg = vim.fn.argv()[1]

        -- as the first buffer is oil's
        local prefix = "oil://"

        -- #string returns the length of the string. why #? because why not?
        if arg.sub(arg, 1, #prefix) == prefix then
            arg = arg.sub(arg, #prefix + 1)
        end

        -- 0 evaluates as true because lua is stupid
        if vim.fn.isdirectory(arg) == 1 then
            -- .. is lua's concat operator, why ..? because why not?
            vim.cmd("cd" .. arg)
        end
    end,
})

PrettyPrint = function (table)
    vim.print(table)
end
