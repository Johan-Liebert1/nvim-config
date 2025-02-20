-- examples for your init.lua

-- OR setup with some options
local nvim_tree = require("nvim-tree")

nvim_tree.setup({
    -- on_attach = function (bufnr)
    --     local api = require("nvim-tree.api")

    --     local opts = function(desc)
    --         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    --     end

    --     -- mark operation
    --     local mark_move_j = function()
    --         api.marks.toggle()
    --         vim.cmd("norm j")
    --     end

    --     local mark_move_k = function()
    --         api.marks.toggle()
    --         vim.cmd("norm k")
    --     end

    --     local mark_remove = function()
    --         local marks = api.marks.list()

    --         if #marks == 0 then
    --             table.insert(marks, api.tree.get_node_under_cursor())
    --         end

    --         vim.ui.input({ prompt = string.format("Remove/Delete %s files? [y/n] ", #marks) }, function(input)
    --             if input == "y" then
    --                 for _, node in ipairs(marks) do
    --                     api.fs.remove(node)
    --                 end

    --                 api.marks.clear()
    --                 api.tree.reload()
    --             end
    --         end)
    --     end

    --     vim.keymap.set("n", "<leader>df", mark_remove, opts("Remove File(s)"))
    --     vim.keymap.set("n", "J", mark_move_j, opts("Toggle Bookmark Down"))
    --     vim.keymap.set("n", "K", mark_move_k, opts("Toggle Bookmark Up"))
    -- end,

    -- Changes the tree root directory on `DirChanged` and refreshes the tree.
    -- sync_root_with_cwd = true,

    -- view = {
    --     adaptive_size = false,
    --     mappings = {
    --         list = {
    --             { key = "u", action = "dir_up" },
    --         },
    --     },
    -- },
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
                bottom = "─",
                none = " ",
            },
        },
        group_empty = true,
    },
})
