local status_ok, toggleterm = pcall(require, 'toggleterm')

if not status_ok then
    return
end

toggleterm.setup {
    open_mapping = [[<leader>tt]],
    direction = 'float',
    insert_mappings = false,
    start_in_insert = true,
    autochdir = true,
    hide_numbers = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

local map = vim.keymap.set

map('n', '<leader>ts', '<cmd>ToggleTerm direction=horizontal<cr>',
    { noremap = true, desc = 'Toggle Horizontal Terminal' })
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=30<cr>',
    { noremap = true, desc = 'Toggle Vertical Terminal' })
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>',
    { noremap = true, desc = 'Toggle Float Terminal' })

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
