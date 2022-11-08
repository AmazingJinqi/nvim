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
    view = {
        adaptive_size = true,
    },
    renderer = {
        highlight_git = true,
    }
}

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { noremap = true, desc = 'NvimTree toggle' })
