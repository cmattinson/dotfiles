require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")

	-- Utils
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons", tag = "nightly" } })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})
	use("terrortylor/nvim-comment")
	use("nvim-lualine/lualine.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
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

	--Icons
	use("kyazdani42/nvim-web-devicons")

	-- Formatting
	use({ "mhartington/formatter.nvim" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")
	-- use("nvim-lua/lsp_extensions.nvim")
	-- use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
	-- use("hrsh7th/cmp-vsnip")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/vim-vsnip")

	-- Colorschemes
	use("folke/tokyonight.nvim")
	use("projekt0n/github-nvim-theme")
	use("sainnhe/edge")
	use("sainnhe/sonokai")
	use("olimorris/onedarkpro.nvim")
	use("EdenEast/nightfox.nvim")
	use("navarasu/onedark.nvim")

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
