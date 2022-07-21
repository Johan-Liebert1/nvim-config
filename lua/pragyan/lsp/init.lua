local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
	return
end

require("pragyan.lsp.lsp-installer")
require("pragyan.lsp.handlers").setup()
