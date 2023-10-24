local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.cmd([[
function! GetFileName()
  return expand("%:t")->split('\.')[0]
endfunc

command! GetFileName         call GetFileName()
]])

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

-- Move lines up or down
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

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

map("n", "<leader>jr", ":execute 'e '.'+/Rules.prototype.'.GetFileName().' src/lib/rules/index.js'<CR>")

map("n", "<leader>nc", ":NotifierClear<CR>")
