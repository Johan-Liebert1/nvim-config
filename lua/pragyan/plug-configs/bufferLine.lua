require("bufferline").setup({
    highlights = {
        error = {
            fg = '#FF0000',
            bg = '#0D1117',
            bold = true,
            italic = true,
        },
        error_diagnostic = {
            fg = '#FF0000',
            bg = '#0D1117',
            bold = true,
            italic = true,
        },
        error_diagnostic_visible = {
            fg = '#FF0000',
            bg = '#0D1117',
            bold = true,
            italic = true,
        },
        error_diagnostic_selected = {
            fg = '#FF0000',
            bg = '#0D1117',
            bold = true,
            italic = true,
        },
    },
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
    },
})
