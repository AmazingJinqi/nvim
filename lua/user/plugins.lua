local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- Autocommand that reloads neovim
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins
    -- See config in themes.lua
    use('EdenEast/nightfox.nvim')

    -- This plugin provides the icons as well as colors for each icon.
    use {
        'nvim-tree/nvim-web-devicons',
        config = function() require('user.plugins.devicons') end
    }

    -- A blazing fast and easy to configure Neovim statusline written in Lua.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function() require('user.plugins.lualine') end
    }

    -- This plugin adds indentation guides to all lines (including empty lines).
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('user.plugins.indent-blankline') end
    }

    -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = {
            'nvim-tree/nvim-web-devicons',
            'moll/vim-bbye',
        },
        config = function() require('user.plugins.bufferline') end
    }

    use {
        'numToStr/Comment.nvim',
        config = function() require('user.plugins.comment') end
    }

    -- WhichKey is a lua plugin that displays a popup with possible key bindings of the command you started typing.
    use {
        'folke/which-key.nvim',
        config = function() require('user.plugins.whichkey') end
    }

    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('user.plugins.colorizer') end
    }

    -- A super powerful autopair plugin for Neovim that supports multiple characters.
    use {
        "windwp/nvim-autopairs",
        config = function() require("user.plugins.autopairs") end
    }

    -- Surround selections
    use {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end
    }

    -- Ranger is a console file manager with VI key bindings.
    use {
        'kevinhwang91/rnvimr',
        config = function() require('user.plugins.rnvimr') end
    }

    -- Jump to any location specified by two characters.
    use {
        'justinmk/vim-sneak',
        config = function() require('user.plugins.sneak') end
    }

    -- Treesitter configurations and abstraction layer for Neovim.
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'p00f/nvim-ts-rainbow',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function() require('user.plugins.treesitter') end,
        run = ':TSUpdate',
    }

    -- When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
    use {
        'christoomey/vim-tmux-navigator',
        config = function() require('user.plugins.vim-tmux-navigator') end,
    }

    -- A completion engine plugin for neovim written in Lua.
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        config = function() require('user.cmp') end,
    }

    -- Configs for the Nvim LSP client.
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'j-hui/fidget.nvim',
        },
        config = function()
            require("user.lsp")
            require("fidget").setup()
        end,
    }

    -- Telescope: Gaze deeply into unknown regions using the power of the moon.
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            -- File browser extension.
            'nvim-telescope/telescope-file-browser.nvim',
            -- An extension for telescope.nvim that allows you to switch between projects.
            'nvim-telescope/telescope-project.nvim',
        },
        config = function()
            require('user.plugins.telescope')
        end,
    }

    -- Super fast git decorations implemented purely in lua/teal.
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('user.plugins.gitsigns') end,
    }

    -- A File Explorer For Neovim Written In Lua.
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function() require('user.plugins.nvim-tree') end,
    }

    -- A neovim plugin to persist and toggle multiple terminals during an editing session.
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function() require('user.plugins.toggleterm') end,
    }

    -- Speed up loading Lua modules in Neovim to improve startup time.
    use {
        'lewis6991/impatient.nvim',
        config = function() require('impatient').enable_profile() end,
    }

    use {
        'karb94/neoscroll.nvim',
        config = function() require('user.plugins.neoscroll') end,
    }

    -- Cheatsheet for keymaps.
    use {
        'sudormrfbin/cheatsheet.nvim',
        config = function() require('user.plugins.cheatsheet') end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if ensure_packer() then
        require('packer').sync()
    end

end)
