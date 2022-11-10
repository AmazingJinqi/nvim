local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-/>"] = actions.which_key,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-w>"] = { "<c-s-w>", type = "command" },
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        planets = {
            theme = 'dropdown',
        },
        find_files = {
            theme = 'dropdown',
        },
        live_grep = {
            theme = 'dropdown',
        },
        grep_string = {
            theme = 'cursor',
        },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
        project = {
            hidden_files = true,
            theme = "dropdown",
            sync_with_nvim_tree = true,
        }
    },
}

require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')


local builtin = require('telescope.builtin')
local map = vim.keymap.set

local function opts(s)
    local opt = { noremap = true, desc = s }
    return opt
end

-- List Pickers
map('n', '<leader>fnp', builtin.planets, opts('Planets'))
map('n', '<leader>fnb', builtin.builtin, opts('Built-in pickers'))
map('n', '<leader>fnr', builtin.reloader, opts('Lua modules'))
map('n', '<leader>fns', builtin.symbols, opts('Symbols'))

-- File Pickers
map('n', '<leader>fff', builtin.find_files, opts('Files'))
map('n', '<leader>ffg', builtin.git_files, opts('Git files'))
map('n', '<leader>ffs', builtin.live_grep, opts('Strings'))
map('n', '<leader>ffS', builtin.grep_string, opts('Strings under cursor'))

-- Vim Pickers
map('n', '<leader>fvb', builtin.buffers, opts('Buffers'))
map('n', '<leader>fva', builtin.autocommands, opts('Autocommands'))
map('n', '<leader>fvc', builtin.commands, opts('Commands'))
map('n', '<leader>fvC', builtin.command_history, opts('Command history'))
map('n', '<leader>fve', builtin.colorscheme, opts('Colorscheme'))
map('n', '<leader>fvf', builtin.current_buffer_fuzzy_find, opts('Strings in the current buffer'))
map('n', '<leader>fvF', builtin.current_buffer_tags, opts('Tags in the current buffer'))
map('n', '<leader>fvh', builtin.help_tags, opts('Help tags'))
map('n', '<leader>fvH', builtin.highlights, opts('Highlights'))
map('n', '<leader>fvj', builtin.jumplist, opts('Jump list'))
map('n', '<leader>fvk', builtin.keymaps, opts('Keymaps'))
map('n', '<leader>fvl', builtin.loclist, opts('Location list'))
map('n', '<leader>fvm', builtin.man_pages, opts('Man pages'))
map('n', '<leader>fvM', builtin.marks, opts('Marks'))
map('n', '<leader>fvo', builtin.oldfiles, opts('Open files'))
map('n', '<leader>fvp', builtin.pickers, opts('Pickers'))
map('n', '<leader>fvq', builtin.quickfix, opts('Quickfix'))
map('n', '<leader>fvQ', builtin.quickfixhistory, opts('Quickfix history'))
map('n', '<leader>fvr', builtin.registers, opts('Registers'))
map('n', '<leader>fvR', builtin.resume, opts('Resume'))
map('n', '<leader>fvs', builtin.search_history, opts('Search history'))
map('n', '<leader>fvS', builtin.spell_suggest, opts('Spell suggestion'))
map('n', '<leader>fvt', builtin.tags, opts('Tags'))
map('n', '<leader>fvT', builtin.filetypes, opts('Filetypes'))
map('n', '<leader>fvv', builtin.vim_options, opts('Vim options'))

-- LSP Pickers
map('n', '<leader>flr', builtin.lsp_references, opts('References'))
map('n', '<leader>fli', builtin.lsp_incoming_calls, opts('Incoming calls'))
map('n', '<leader>flo', builtin.lsp_outgoing_calls, opts('Outgoing calls'))
map('n', '<leader>fls', builtin.lsp_document_symbols, opts('Document symbols'))
map('n', '<leader>flS', builtin.lsp_workspace_symbols, opts('Document symbols in the current workspace'))
map('n', '<leader>flx', builtin.lsp_dynamic_workspace_symbols,
    opts('Document symbols in the current workspace dynamically'))
map('n', '<leader>fld', builtin.diagnostics, opts('Diagnostics'))
map('n', '<leader>flI', builtin.lsp_implementations, opts('Implementations'))
map('n', '<leader>flD', builtin.lsp_definitions, opts('Definitions'))
map('n', '<leader>flt', builtin.lsp_type_definitions, opts('Type definitions'))

-- Git Pickers
map('n', '<leader>fgc', builtin.git_commits, opts('Git commits'))
map('n', '<leader>fgC', builtin.git_bcommits, opts('Buffer\'s git commits'))
map('n', '<leader>fgb', builtin.git_branches, opts('Git branches'))
map('n', '<leader>fgs', builtin.git_status, opts('Git status'))
map('n', '<leader>fgS', builtin.git_stash, opts('Stash items'))

-- Treesitter Picker
map('n', '<leader>ft', builtin.treesitter, opts('Treesitter'))

-- File Browser extensions
map('n', '<leader>fb', telescope.extensions.file_browser.file_browser, opts('File browser'))

-- Project extensions
map('n', '<leader>fp', function() telescope.extensions.project.project { display_type = 'full' } end, opts('Projects'))
