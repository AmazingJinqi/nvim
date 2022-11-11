local status_ok, illuminate = pcall(require, "illuminate")

if not status_ok then
    return
end

illuminate.configure {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 500,
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'alpha',
        'NvimTree',
        'toggleterm',
        "TelescopePrompt",
    },
}

local map = vim.keymap.set

local function opts(s)
    local opt = { noremap = true, desc = s }
    return opt
end

map('n', ']r', illuminate.goto_next_reference, opts('Next reference'))
map('n', '[r', illuminate.goto_prev_reference, opts('Previous reference'))
map('n', '<leader>ti', '<cmd>IlluminateToggle<cr>', opts('Toggle Illuminate'))
