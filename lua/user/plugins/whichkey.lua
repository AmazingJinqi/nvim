local status_ok, whichkey = pcall(require, 'which-key')

if not status_ok then
    return
end

-- local presets = require("which-key.plugins.presets")
-- presets.operators["v"] = nil

whichkey.setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        }
    },
    popup_mappings = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
    },
    disable = {
        filetypes = { 'NvimTree' },
    },
}

whichkey.register({
    ['<leader>s'] = { name = 'Sneak' },
    ['<leader>t'] = { name = 'Toggle' },
    ['<leader>f'] = { name = 'Telescope' },
    ['<leader>ff'] = { name = 'File Pickers' },
    ['<leader>fv'] = { name = 'Vim Pickers' },
    ['<leader>fl'] = { name = 'LSP Pickers' },
    ['<leader>fg'] = { name = 'Git Picker' },
    ['<leader>h'] = { name = 'Gitsigns' },
    ['<leader>tg'] = { name = 'Gitsigns toggle' },
})
