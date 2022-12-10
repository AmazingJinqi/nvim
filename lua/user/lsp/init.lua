local lspconfig_status_ok, _ = pcall(require, 'lspconfig')

if not lspconfig_status_ok then
    return
end

require('lspconfig.ui.windows').default_options.border = 'single'

require('user.lsp.mason')
require('user.lsp.handlers').setup()
require('user.lsp.null-ls')

local fidget_status_ok, fidget = pcall(require, 'fidget')

if fidget_status_ok then
    fidget.setup()
end

vim.lsp.buf.format({ timeout_ms = 2000 })
