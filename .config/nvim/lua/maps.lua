local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope git_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")
map("n", "<C-b>", ":NvimTreeToggle<CR>")

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

-- Comment lines with C-/ in normal and visual mode
map("n", "<C-_>", ":CommentToggle<CR>")
vim.cmd("vnoremap <C-_> :CommentToggle<CR>")

-- Move lines up or down
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "<leader>f", ":Format<CR>")
map("n", "<leader>F", ":FormatWrite<CR>")

map("n", "<leader>do", ":DiffviewOpen<CR>")
map("n", "<leader>dc", ":DiffviewClose<CR>")
map("n", "<leader>df", ":DiffviewToggleFiles<CR>")
