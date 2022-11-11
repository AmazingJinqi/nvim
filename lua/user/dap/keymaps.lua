local dap_status_ok, dap = pcall(require, 'dap')

if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")

if not dap_ui_status_ok then
    return
end

local map = vim.keymap.set

local function opts(s)
    local opt = { noremap = true, desc = s }
    return opt
end

-- map('n', '<leader>db', dap.toggle_breakpoint, opts('Toggle breakpoint'))
map('n', '<leader>db', '<cmd>PBToggleBreakpoint<cr>', opts('Toggle breakpoint'))
-- map('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('[Condition] > ')) end,
--     opts('Set conditional breakpoint'))
map('n', '<leader>dB', '<cmd>PBSetConditionalBreakpoint<cr>', opts('Set conditional breakpoint'))
map('n', '<leader>dc', dap.continue, opts('Continue'))
map('n', '<leader>di', dap.step_into, opts('Step into'))
map('n', '<leader>do', dap.step_over, opts('Step over'))
map('n', '<leader>dO', dap.step_out, opts('Step out'))
map('n', '<leader>dr', dap.repl.toggle, opts('Toggle REPL'))
map('n', '<leader>dl', dap.run_last, opts('Rerun'))
map('n', '<leader>du', dapui.toggle, opts('Toggle dapui'))
map('n', '<leader>dt', dap.terminate, opts('Terminate'))
-- map('n', '<leader>dd', dap.clear_breakpoints, opts('Clear all breakpoints'))
map('n', '<leader>dd', '<cmd>PBClearAllBreakpoints<cr>', opts('Clear all breakpoints'))
map('n', '<leader>da', function() dap.list_breakpoints() vim.cmd [[ copen ]] end, opts('List all breakpoints'))

map('n', '<leader>dvt', '<cmd>DapVirtualTextToggle<cr>', opts('Toggle virtual text'))
map('n', '<leader>dvr', '<cmd>DapVirtualTextForceRefresh<cr>', opts('Refresh virtual text'))
