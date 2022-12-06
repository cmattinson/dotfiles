local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope git_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")
map("n", "<C-b>", ":NERDTreeToggle<CR>")

-- Move to next match and center cursor
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Navigate between buffers
map("n", "<C-PageUp>", ":bprev<CR>")
map("n", "<C-PageDown>", ":bnext<CR>")

-- Close current buffer
map("n", "<C-X>", ":bd<CR>")

-- Add blank lines above or below in normal mode
map("n", "<leader>o", "o<ESC>")
map("n", "<leader>O", "O<ESC>")

-- Jump between buffers
map("n", "<leader>1", "<Plug>BufTabLine.Go(1)")
map("n", "<leader>2", "<Plug>BufTabLine.Go(2)")
map("n", "<leader>3", "<Plug>BufTabLine.Go(3)")
map("n", "<leader>4", "<Plug>BufTabLine.Go(4)")
map("n", "<leader>5", "<Plug>BufTabLine.Go(5)")
map("n", "<leader>6", "<Plug>BufTabLine.Go(6)")
map("n", "<leader>7", "<Plug>BufTabLine.Go(7)")
map("n", "<leader>8", "<Plug>BufTabLine.Go(8)")
map("n", "<leader>9", "<Plug>BufTabLine.Go(9)")
map("n", "<leader>0", "<Plug>BufTabLine.Go(10)")

-- Comment lines with C-/ in normal and visual mode
map("n", "<C-_>", ":CommentToggle<CR>")
vim.cmd("vnoremap <C-_> :CommentToggle<CR>")

-- Move lines up or down
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "<leader>f", ":Format<CR>")
map("n", "<leader>F", ":FormatWrite<CR>")

map("n", "<leader>do", ":DiffviewOpen<CR>")
map("n", "<leader>dc", ":DiffviewClose<CR>")
map("n", "<leader>df", ":DiffviewToggleFiles<CR>")
