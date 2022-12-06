require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")

	-- Utils
	use("nvim-lua/plenary.nvim")
	use("tpope/vim-fugitive")
	use("preservim/nerdtree")
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
	use("ap/vim-buftabline")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Formatting
	use("sbdchd/neoformat")
	use({ "prettier/vim-prettier", run = "npm install --frozen-lockfile --production" })
	use({ "mhartington/formatter.nvim" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp_extensions.nvim")
	use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/vim-vsnip")

	-- Colorschemes
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use("rktjmp/lush.nvim")
	use("RRethy/nvim-base16")
	use("ramojus/meliora.nvim")
    use("rose-pine/neovim")
end)
