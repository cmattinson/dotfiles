require("dapui").setup({
	controls = {
		element = "repl",
		icons = {
			play = "",
			pause = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
})

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

vim.keymap.set("n", "<leader>db", require("dapui").toggle)