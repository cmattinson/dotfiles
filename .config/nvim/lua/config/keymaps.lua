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
-- map("n", "n", "nzz")
-- map("n", "N", "Nzz")

-- map("n", "<C-u>", "<C-u>zz")
-- map("n", "<C-d>", "<C-d>zz")

-- Join lines and stay in place
map("n", "J", "mzJ`z")

-- Keep pasting what has been copied
map("x", "p", '"_dP')

-- Navigate between buffers
map("n", "<C-PageUp>", ":bprev<CR>")
map("n", "<C-PageDown>", ":bnext<CR>")

-- Close current buffer
map("n", "<C-c>", ":bd<CR>")

-- Add blank lines above or below in normal mode
map("n", "<leader>o", "o<ESC>")
map("n", "<leader>O", "O<ESC>")

map("n", "<A-p>", ":cprev<CR>")
map("n", "<A-n>", ":cnext<CR>")

map("i", "<C-s>", vim.lsp.buf.signature_help)
map("n", "<C-e>", ":lua require('dapui').eval()<CR>")

map("n", "-", require("oil").open)

map("n", "<leader>dp", vim.diagnostic.goto_prev)
map("n", "<leader>dn", vim.diagnostic.goto_next)

map("n", "<leader>jr", ":e api/src/rules/index.js<CR>")

map("n", "<leader>nc", ":NotifierClear<CR>")

map("n", "<A-,>", ":vertical resize -10<CR>")
map("n", "<A-.>", ":vertical resize +10<CR>")
map("n", "<A-down>", ":horizontal resize +10<CR>")
map("n", "<A-up>", ":horizontal resize -10<CR>")

map("n", "<leader>sv", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
