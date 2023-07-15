local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.cmd([[
function! GetFileName()
  return expand("%:t")->split('\.')[0]
endfunc

command! GetFileName         call GetFileName()
]])

vim.g.mapleader = " "

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope git_files<CR>")
map("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "<C-b>", ":NvimTreeToggle<CR>")
map("n", "<leader>tb", ":Telescope buffers<CR>")
map("n", "<leader>p", ":Neoformat prettier<CR>")

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

map("n", "<C-Left>", "<Plug>(cokeline-switch-prev)", { silent = true })
map("n", "<C-Right>", "<Plug>(cokeline-switch-next)", { silent = true })

map("n", "<leader>lg", ":LazyGit<CR>")

map("n", "<A-Up>", ":cprev<CR>")
map("n", "<A-Down>", ":cnext<CR>")

map("n", "<leader>db", ":lua require('dapui').toggle()<CR>")
map(
	"n",
	"<leader>dr",
	":execute 'e '.'+/Rules.prototype.'.GetFileName().' src/lib/rules/index.js'<CR>:lua require('dapui').toggle()<CR>"
)

map("n", "<C-s>", ":call SynStack()<CR>")
map("n", "<C-e>", ":lua require('dapui').eval()<CR>")

map("n", "-", require("oil").open, { desc = "Open parent directory" })

map("n", "<leader>jr<CR>", ":e src/lib/rules/index.js")
