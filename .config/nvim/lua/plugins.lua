require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'tpope/vim-fugitive'
        use 'preservim/nerdtree'
        use 'nvim-telescope/telescope.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'terrortylor/nvim-comment'
        use 'nvim-lualine/lualine.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'sbdchd/neoformat'
        use { 'prettier/vim-prettier',  run = 'npm install --frozen-lockfile --production' }
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-compe'
        use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
        use 'ap/vim-buftabline'

        -- Colorschemes
        use 'navarasu/onedark.nvim'
        use 'folke/tokyonight.nvim'
        use 'yong1le/darkplus.nvim'
        use 'RRethy/nvim-base16'
        use 'olimorris/onedarkpro.nvim'
    end
)

