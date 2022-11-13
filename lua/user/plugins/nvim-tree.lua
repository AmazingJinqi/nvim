local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    update_cwd = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,

        ignore_list = {},
    },
    prefer_startup_root = true,
    view = {
        adaptive_size = true,
        hide_root_folder = true,
        mappings = {
            list = {
                { key = '<C-s>', action = 'split' },
                { key = 'u', action = 'dir_up' },
            }
        },
    },
    renderer = {
        highlight_git = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    log = {
        enable = true,
        truncate = true,
        types = {
            diagnostics = true,
            git = true,
            profile = true,
            watcher = true,
        },
    },
}

vim.keymap.set('n', '<leader>tn', '<cmd>NvimTreeToggle<cr>', { noremap = true, desc = 'Toggle NvimTree' })
