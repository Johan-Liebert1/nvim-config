local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
    return
end

require('neodev').setup()  -- Automatically adds Neovim runtime and type annotations for lua_ls

require("pragyan.lsp.mason")
require("pragyan.lsp.handlers").setup()
