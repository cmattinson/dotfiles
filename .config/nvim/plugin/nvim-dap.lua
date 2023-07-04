local dap = require("dap")

-- Set keymaps to control the debugger
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F1>", require("dap").step_into)
vim.keymap.set("n", "<F2>", require("dap").step_over)
vim.keymap.set("n", "<F3>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
