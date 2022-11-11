local map = vim.keymap.set

local function opts(s)
    local opt = { noremap = true, desc = s }
    return opt
end

map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts('Toggle breakpoints'))
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts('Continue'))
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts('Step into'))
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts('Step over'))
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts('Step out'))
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts('Toggle REPL'))
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts('Rerun'))
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts('Toggle dapui'))
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts('Terminate'))
