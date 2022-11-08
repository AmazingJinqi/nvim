vim.g.tmux_navigator_no_mappings = 1

local map = vim.keymap.set
local noremap = { noremap = true }

map('n', '<C-w>h',      '<cmd>TmuxNavigateLeft<cr>', noremap)
map('n', '<C-w><C-h>',  '<cmd>TmuxNavigateLeft<cr>', noremap)
map('n', '<C-w>j',      '<cmd>TmuxNavigateDown<cr>', noremap)
map('n', '<C-w><C-j>',  '<cmd>TmuxNavigateDown<cr>', noremap)
map('n', '<C-w>k',      '<cmd>TmuxNavigateUp<cr>', noremap)
map('n', '<C-w><C-k>',  '<cmd>TmuxNavigateUp<cr>', noremap)
map('n', '<C-w>l',      '<cmd>TmuxNavigateRight<cr>', noremap)
map('n', '<C-w><C-l>',  '<cmd>TmuxNavigateRight<cr>', noremap)
map('n', '<C-w>\\',     '<cmd>TmuxNavigatePrevious<cr>', noremap)
map('n', '<C-w><C-\\>',  '<cmd>TmuxNavigatePrevious<cr>', noremap)
