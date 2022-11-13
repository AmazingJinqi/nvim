local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
    return
end

gitsigns.setup {
    signs = {
        add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        untracked = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Next git hunk' })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Previous git hunk' })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Stage hunk under cursor' })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunks' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all hunks in the current buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo last stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset all hunks' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Git blame on the current line' })
        map('n', '<leader>tgb', gs.toggle_current_line_blame, { desc = 'Current line blame toggle' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diffthis' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Diffthis ~' })
        map('n', '<leader>tgd', gs.toggle_deleted, { desc = 'Show deleted toggle' })
        map('n', '<leader>tgs', gs.toggle_signs, { desc = 'Show signs toggle' })
        map('n', '<leader>tgn', gs.toggle_numhl, { desc = 'Show number highlight toggle' })
        map('n', '<leader>tgl', gs.toggle_linehl, { desc = 'Show line highlight toggle' })
        map('n', '<leader>tgw', gs.toggle_word_diff, { desc = 'Show word diff toggle' })

        -- Text object
        map({ 'o', 'x' }, 'ih', '<cmd>Gitsigns select_hunk<CR>')

        local status_ok, whichkey = pcall(require, 'which-key')

        if not status_ok then
            return
        end

        whichkey.register({
            ['<leader>h'] = { name = 'Gitsigns' },
            ['<leader>tg'] = { name = 'Toggle Gitsigns' },
        })

    end
}
