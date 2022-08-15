local g = vim.g

require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'nvim-lualine/lualine.nvim'
        use 'folke/tokyonight.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'sbdchd/neoformat'
        use { 'prettier/vim-prettier',  run = 'npm install --frozen-lockfile --production' }
        use 'preservim/nerdtree'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-compe'
        use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
        use 'arcticicestudio/nord-vim'
        use 'tpope/vim-fugitive'
        use 'ap/vim-buftabline'
        use 'navarasu/onedark.nvim'
        use 'yong1le/darkplus.nvim'
        use 'RRethy/nvim-base16'
end
)

g.tokyonight_style = "storm"
g.tokyonight_italic_functions = 0
g.tokyonight_italic_keywords = 0
g.tokyonight_italic_comments = 0
g.material_style = "palenight"

g.buftabline_show = 1
g.buftabline_numbers = 0

g.sonokai_style = "andromeda"
g.sonokai_enable_italic = 0
g.sonokai_disable_italic_comment = 1
g.sonokai_transparent_background = 1

g.github_comment_style = "NONE"
g.github_keyword_style = "NONE"
g.github_function_style = "NONE"
g.github_variable_style = "NONE"
g.github_transparent = "true"

require('onedark').setup  {
    style = 'cool', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
}

require('onedark').load()

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'palenight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

require'lspconfig'.gopls.setup{}

vim.o.completeopt = "menuone,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })

require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
