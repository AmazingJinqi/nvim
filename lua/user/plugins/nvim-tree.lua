local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    -- ignore_ft_on_setup = {
    --     "startify",
    --     "dashboard",
    --     "alpha",
    -- },
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    sync_root_with_cwd = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
    },
    remove_keymaps = { "<Tab>" },
    prefer_startup_root = true,
    view = {
        adaptive_size = true,
        hide_root_folder = false,
        mappings = {
            list = {
                { key = '<C-s>', action = 'split' },
                { key = 'u',     action = 'dir_up' },
            }
        },
    },
    renderer = {
        highlight_opened_files = "name",
    },
    -- actions = {
    --     window_picker = { enable = true },
    -- },
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

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
