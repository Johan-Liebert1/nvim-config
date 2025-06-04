local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignError", text = "" },
    }

    vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
    vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

    local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = true,
        -- severity_sort = true,
        float = {
            focusable = true,
            style = "default",
            border = border,
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    -- Override open_floating_preview globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
    })

    -- prevent inactive code from showing up in the "comment" color
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "" })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- diagnostic info
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- formatting files, this does not work
    -- vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

    -- next and previous diagnostic
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    -- vim.cmd([[ autocmd BufWritePre * lua vim.lsp.buf.format({ timeout_ms = 2000 }) ]])
end

M.on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    -- client.server_capabilities.document_highlight = true
    lsp_keymaps(bufnr)
    -- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- need to do this for some reason
local lsps = { "ts_ls", "eslint", "gopls", "bashls", "clangd", "yamlls", "html", "rust_analyzer", "pyright", "cmake", "vuels", "lua_ls" }

for _, lspName in ipairs(lsps) do
    local config = {
        on_attach  = M.on_attach,
        capabilities = M.capabilities
    }

    if lspName == "gopls" then
        config.settings = {
            gopls = {
                env = {
                    GOOS = "linux"
                },
                buildFlags = { "-tags=rdp" }
            }
        }
    end

    -- if lspName == "rust_analyzer" then
    --     config.settings =  {
    --         ["rust_analyzer"] = {
    --             diagnostics = {
    --                 disabled = { "inactive-code" }, -- disables marking inactive code
    --             },
    --             cargo = {
    --                 allFeatures = true, -- enables code behind feature flags
    --             },
    --         },
    --     }
    -- end

    if lspName == "lua_ls" then
        config.settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true), -- Make Neovim runtime files available to lua_ls
                    checkThirdParty = false -- Optional: Disable third-party checks
                },
                telemetry = {
                    enable = false
                }
            }
        }
    end

    require('lspconfig')[lspName].setup(config)
end

return M
