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
    }
}

whichkey.register({
    ['<leader>s'] = { name = 'Sneak' },
    ['<leader>t'] = { name = 'Toggle' },
})
