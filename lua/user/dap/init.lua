local dap_status_ok, _ = pcall(require, 'dap')

if not dap_status_ok then
    return
end

require('user.dap.dapui')
require('user.dap.keymaps')
require('persistent-breakpoints').setup {
    load_breakpoints_event = { "BufReadPost" }
}

local go_status_ok, go = pcall(require, 'dap-go')

if go_status_ok then
    go.setup()
end
