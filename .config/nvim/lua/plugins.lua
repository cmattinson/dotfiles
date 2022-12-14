require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")

	-- Utils
	use("nvim-lua/plenary.nvim")
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons", tag = "nightly" } })
	use("nvim-telescope/telescope.nvim")
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
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"noib3/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
	})

    --Icons
    use("kyazdani42/nvim-web-devicons")

	-- Formatting
	use({ "prettier/vim-prettier", run = "npm install --frozen-lockfile --production" })
	use({ "mhartington/formatter.nvim" })

	-- LSP
	-- use("neovim/nvim-lspconfig")
	-- use("nvim-lua/lsp_extensions.nvim")
	-- use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
	-- use("rust-lang/rust.vim")
	-- use("simrat39/rust-tools.nvim")
	-- use("hrsh7th/nvim-cmp")
	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-vsnip")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/vim-vsnip")

	-- Colorschemes
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use("rktjmp/lush.nvim")
	use("rose-pine/neovim")
end)
