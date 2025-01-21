return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
	event = "BufEnter",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "node-debug2-adapter" },
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				-- node2 = function(config)
				-- 	config.configurations = {
				-- 		{
				-- 			name = "Debug: Attach to process",
				-- 			type = "node2",
				-- 			command = vim.fn.exepath("node-debug2-adapter"),
				-- 			request = "attach",
				-- 			processId = function()
				-- 				require("dap.utils").pick_process()
				-- 			end,
				-- 		},
				-- 	}

				-- 	require("mason-nvim-dap").default_setup(config)
				-- end,
			},
		})
	end,
}
