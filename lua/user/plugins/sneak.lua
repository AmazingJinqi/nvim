local g = vim.g
local map = vim.keymap.set

g['sneak#label'] = 1

-- case insensitive sneak
g['sneak#use_ic_scs'] = 1

-- immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
g['sneak#s_next'] = 1

-- Cool prompts
g['sneak#prompt'] = ' '

-- 2-character Sneak
map('', '<leader>ss', '<plug>Sneak_s', { noremap = true, desc = 'Go to the next {c}{c}' })
map('', '<leader>sS', '<plug>Sneak_S', { noremap = true, desc = 'Go to the previous {c}{c}' })

-- 1-character Sneak
map('', '<leader>sf', '<plug>Sneak_f', { noremap = true, desc = 'Go to the next {c}' })
map('', '<leader>sF', '<plug>Sneak_F', { noremap = true, desc = 'Go to the previous {c}' })
map('', '<leader>st', '<plug>Sneak_t', { noremap = true, desc = 'Go to the 1 char before next {c}' })
map('', '<leader>sT', '<plug>Sneak_T', { noremap = true, desc = 'Go to the 1 char before previous {c}' })

local wk_status_ok, whichkey = pcall(require, 'which-key')

if not wk_status_ok then
    print("error")
    return
end

whichkey.register({
    ['<leader>s'] = { name = 'Sneak' },
})
