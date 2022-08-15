local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })

end

map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<C-b>', ':NERDTreeToggle<CR>')

-- Move to next match and center cursor
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Navigate between buffers
map('n', '<C-PageUp>', ':bprev<CR>')
map('n', '<C-PageDown>', ':bnext<CR>')

-- Close current buffer
map('n', '<C-X>', ':bd<CR>')

-- Add blank lines above or below in normal mode
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- Jump between buffers
map('n', '<leader>1', '<Plug>BufTabLine.Go(1)')
map('n', '<leader>2', '<Plug>BufTabLine.Go(2)')
map('n', '<leader>3', '<Plug>BufTabLine.Go(3)')
map('n', '<leader>4', '<Plug>BufTabLine.Go(4)')
map('n', '<leader>5', '<Plug>BufTabLine.Go(5)')
map('n', '<leader>6', '<Plug>BufTabLine.Go(6)')
map('n', '<leader>7', '<Plug>BufTabLine.Go(7)')
map('n', '<leader>8', '<Plug>BufTabLine.Go(8)')
map('n', '<leader>9', '<Plug>BufTabLine.Go(9)')
map('n', '<leader>0', '<Plug>BufTabLine.Go(10)')
