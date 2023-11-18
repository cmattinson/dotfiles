require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Utils
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons", tag = "nightly" } })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})
	use("terrortylor/nvim-comment")
	use("nvim-lualine/lualine.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { "nvim-treesitter/nvim-treesitter-textobjects", "JoosepAlviste/nvim-ts-context-commentstring" },
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"noib3/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
	})
	use("tpope/vim-fugitive")
	use("tpope/vim-scriptease")
	use("kdheepak/lazygit.nvim")
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use("tpope/vim-sleuth")
	use("stevearc/oil.nvim")
	use("AndrewRadev/bufferize.vim")
	use("folke/trouble.nvim")
	use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })
	use("theprimeagen/harpoon")

	--Icons
	use("kyazdani42/nvim-web-devicons")

	-- Formatting
	use({ "mhartington/formatter.nvim" })
	use({ "stevearc/conform.nvim" })

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("ray-x/go.nvim")

	-- Colorschemes
	use("folke/tokyonight.nvim")
	use("projekt0n/github-nvim-theme")
	use("navarasu/onedark.nvim")
	use("RRethy/nvim-base16")
	use("ellisonleao/gruvbox.nvim")
	use("marko-cerovac/material.nvim")

	-- Debugging
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})
	use("ChristianChiarulli/neovim-codicons")
end)
