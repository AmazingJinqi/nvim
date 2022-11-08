local status_ok, lspconfig = pcall(require, 'lspconfig')

if not status_ok then
    return
end

require("lsp.mason")
require("lsp.handlers").setup()
