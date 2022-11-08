local map = vim.keymap.set
local noremap = { noremap = true }

vim.g.mapleader = ' ' -- map leader to space

-- Use alt + hjkl to resize windows
map('n', '<M-j>', '<cmd>resize -2<cr>', noremap)
map('n', '<M-k>', '<cmd>resize +2<cr>', noremap)
map('n', '<M-h>', '<cmd>vertical resize -2<cr>', noremap)
map('n', '<M-l>', '<cmd>vertical resize +2<cr>', noremap)

-- Switch buffer
map('n', '<TAB>', '<cmd>bnext<cr>', noremap)
map('n', '<S-TAB>', '<cmd>bprevious<cr>', noremap)

-- Better tabbing
map('v', '<', '<gv', noremap)
map('v', '>', '>gv', noremap)

-- Go back to normal mode in terminal
map('t', '<Esc>', '<C-\\><C-n>', noremap)
