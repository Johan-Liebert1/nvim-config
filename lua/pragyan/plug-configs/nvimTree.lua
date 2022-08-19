-- examples for your init.lua

-- OR setup with some options
require("nvim-tree").setup({
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "",
                edge = "│",
                item = "│",
                none = " ",
            },
        },
        group_empty = true,
    },
})
