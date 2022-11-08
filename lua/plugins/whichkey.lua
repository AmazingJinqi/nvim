local status_ok, whichkey = pcall(require, 'which-key')

if not status_ok then
    return
end

whichkey.register(mappings, opts)

local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

whichkey.setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        }
    },
    popup_mappings = {
        scroll_down = '<C-n>',
        scroll_up = '<C-p>',
    }
}
