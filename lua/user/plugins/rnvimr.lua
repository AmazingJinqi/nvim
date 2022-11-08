local status_ok, ranger = pcall(require, 'rnvimr')

if not status_ok then
    return
end

local g = vim.g

-- Make Ranger replace netrw and be the file explorer
g.rnvimr_ex_jnable = 1

-- Make Ranger to be hidden after picking a file
g.rnvimr_enable_picker = 1

-- Draw border with both
g.rnvimr_ranger_cmd = {'ranger', '--cmd=set draw_borders both'}

-- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
g.rnvimr_enable_bw = 1

-- Link CursorLine into RnvimrNormal highlight in the Floating window
vim.api.nvim_set_hl(0, 'RnvimrNormal', { link = 'CursorLine' })

vim.keymap.set('n', '<leader>tr', '<cmd>RnvimrToggle<cr>', { noremap = true, desc = 'Ranger Toggle' })
