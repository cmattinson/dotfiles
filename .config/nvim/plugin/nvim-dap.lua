local dap = require("dap")

-- Set keymaps to control the debugger
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "StatusLine", linehl = "StatusLine", numhl = "StatusLine" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "IncSearch", linehl = "IncSearch", numhl = "IncSearch" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "WarningMsg", linehl = "WarningMsg", numhl = "WarningMsg" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<leader>dc", require("dap").clear_breakpoints)
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F1>", require("dap").step_into)
vim.keymap.set("n", "<F2>", require("dap").step_over)
vim.keymap.set("n", "<F3>", require("dap").step_out)
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
