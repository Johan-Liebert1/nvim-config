local configs = require("nvim-treesitter")

configs.setup({
    -- ensure_installed = "maintained",
    sync_install = false,

    ignore_install = { "" }, -- List of parsers to ignore installing

    highlight = {
        enable = true, -- false will disable the whole extension

        -- Disable on large buffers
        disable = function(lang, bufnr)
            -- or vim.api.nvim_buf_set_extmark > 10000
            return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,

        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true, disable = { "yaml" } },

    rainbow = {
        enable = true,
        disable = { "html" }, -- list of languages you want to disable the plugin for
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than n lines, int
        -- termcolors = {} -- table of colour name strings
    },
})

-- set filetype? to see the autodetected filetype

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "go", "lua", "c", "cpp", "rust", "html", "javascript", "javascriptreact", "typescriptreact", "css", "python", "yaml", "json" },
  callback = function() vim.treesitter.start() end,
})
