return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "jay-babu/mason-nvim-dap.nvim", "nvim-telescope/telescope-dap.nvim" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("telescope").load_extension("dap")
		require("dapui").setup({
			controls = {
				element = "repl",
				enabled = true,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.33,
						},
						{
							id = "breakpoints",
							size = 0.33,
						},
						{
							id = "watches",
							size = 0.33,
						},
					},
					position = "right",
					size = 30,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "StatusLine", linehl = "StatusLine", numhl = "StatusLine" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "IncSearch", linehl = "IncSearch", numhl = "IncSearch" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "WarningMsg", linehl = "WarningMsg", numhl = "WarningMsg" }
		)
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
	end,
}
