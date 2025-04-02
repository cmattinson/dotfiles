return {
	"jay-babu/mason-nvim-dap.nvim",
	opts = {
		handlers = {},
		automatic_installation = {},
		ensure_installed = {
			"node-debug2-adapter",
			"js-debug-adapter",
			"python",
		},
	},
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
}
