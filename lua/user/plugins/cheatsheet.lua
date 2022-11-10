local status_ok, cheatsheet = pcall(require, 'cheatsheet')

if not status_ok then
    return
end

cheatsheet.setup()

vim.keymap.set('n', '<leader>?', '<cmd>Cheatsheet<cr>', { noremap = true, desc = 'Cheatsheet' })
