local opt = vim.opt

opt.hidden = true                       -- Required to keep multiple buffers open multiple buffers
opt.wrap = false                        -- Display long lines as just one line
opt.pumheight = 10                      -- Makes popup menu smaller
opt.fileencoding = 'utf-8'              -- The encoding written to file
opt.cmdheight = 2                       -- More space for displaying messages
opt.mouse = 'a'                         -- Enable your mouse
opt.splitbelow = true                   -- Horizontal splits will automatically be below
opt.splitright = true                   -- Vertical splits will automatically be to the right
opt.termguicolors = true                -- Set term gui colors
opt.conceallevel = 0                    -- So that I can see `` in markdown files
opt.tabstop = 4                         -- Insert 4 spaces for a tab
opt.shiftwidth = 4                      -- Change the number of space characters inserted for indentation
opt.smarttab = true                     -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab = true                    -- Converts tabs to spaces
opt.smartindent = true                  -- Makes indenting smart
opt.autoindent = true                   -- Good auto indent
opt.laststatus = 0                      -- Always display the status line
opt.number = true                       -- Line numbers
opt.cursorline = true                   -- Enable highlighting of the current line
opt.cursorcolumn = true 	        -- Enable highlighting of the current column
opt.background = 'dark'                 -- tell vim what the background color looks like
opt.showtabline = 2                     -- Always show tabs
opt.showmode = false                    -- We don't need to see things like -- INSERT -- anymore
opt.backup = false                      -- This is recommended by coc
opt.writebackup = false                 -- This is recommended by coc
opt.updatetime = 300                    -- Faster completion
opt.timeoutlen = 1000                    -- By default timeoutlen is 1000 ms
opt.clipboard = 'unnamedplus'           -- Copy paste between vim and everything else
opt.ignorecase = true                   -- Ignore case in search patterns
opt.scrolloff = 8                       -- This keeps 5 lines visible above/below the cursor.
opt.iskeyword:append('-')               -- treat dash separated words as a word text object"

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
    pattern = '*',
    callback = function()
        opt.formatoptions:remove({'c', 'r', 'o'})
    end,                                -- Stop newline continution of comments
})
