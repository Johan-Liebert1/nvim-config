local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    -- debug = true,
    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.gofmt,
        formatting.deno_fmt.with({
            extra_args = {
                "--options-line-width",
                "90",
                "--options-single-quote",
                "true",
                "--options-indent-width",
                "4",
                "--options-semi-colon",
                "true",
            },
        }),
        formatting.prettierd.with({
            disabled_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "conf" },
        }), -- use deno instead,
    },
})
