-- examples for your init.lua

-- OR setup with some options
require("nvim-tree").setup({
    -- Changes the tree root directory on `DirChanged` and refreshes the tree.
    sync_root_with_cwd = true,
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    actions = {
        change_dir = {
            restrict_above_cwd = true
        }
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
