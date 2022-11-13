local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup end
        ]], false)
    end
end

local function lsp_keymaps(bufnr)
    local function bufopts(s)
        local opt = { noremap = true, buffer = bufnr, desc = s }
        return opt
    end

    local map = vim.keymap.set

    map('n', '<leader>le', function() vim.diagnostic.open_float({ border = "rounded", scope = "line" }) end,
        bufopts('Show diagnostics in the current line'))
    map('n', '[d', function() vim.diagnostic.goto_prev({ border = "rounded" }) end, bufopts('Go to previous diagnostics'))
    map('n', ']d', function() vim.diagnostic.goto_next({ border = "rounded" }) end, bufopts('Go to next diagnostics'))
    map('n', '<leader>lq', vim.diagnostic.setloclist, bufopts('Add buffer diagnostics to the location list'))
    map('n', 'gD', vim.lsp.buf.declaration, bufopts('Go to declaration'))
    map('n', 'gd', vim.lsp.buf.definition, bufopts('Go to definition'))
    map('n', 'K', vim.lsp.buf.hover, bufopts('LSP hover'))
    map('n', 'gI', vim.lsp.buf.implementation, bufopts('Go to implementation'))
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts('Show signature'))
    map('n', 'gr', vim.lsp.buf.references, bufopts('Go to references'))
    map('n', '<leader>la', vim.lsp.buf.add_workspace_folder, bufopts('Add workspace folder'))
    map('n', '<leader>lr', vim.lsp.buf.remove_workspace_folder, bufopts('Remove workspace folder'))
    map('n', '<leader>ll', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        bufopts('List workspace folders'))
    map('n', '<leader>ld', vim.lsp.buf.type_definition, bufopts('Go to type definition'))
    map('n', '<leader>ln', vim.lsp.buf.rename, bufopts('Rename'))
    map('n', '<leader>lc', vim.lsp.buf.code_action, bufopts('Code actions'))
    map('n', '<leader>li', '<cmd>LspInfo<cr>', bufopts('LSP info'))
    map('n', '<leader>lI', '<cmd>LspInstallInfo<cr>', bufopts('LSP installation info'))

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]]

    map('n', '<leader>/', '<cmd>Format<cr>', bufopts('Format'))

    vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.format() ]]

    local status_ok, whichkey = pcall(require, 'which-key')

    if not status_ok then
        return
    end

    whichkey.register({
        ['<leader>l'] = { name = 'LSP' },
    })
end

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- if client.name == "tsserver" then
    --     client.server_capabilities.documentFormattingProvider = false
    -- end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    local navic_status_ok, navic = pcall(require, 'nvim-navic')

    if navic_status_ok and client.server_capabilities["documentSymbolProvider"] then
        navic.attach(client, bufnr)
        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
