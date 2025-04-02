vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.lazy")
require("config.keymaps")
require("config.sets")
require("config.winbar")
require("functions.cleanservice")
require("functions.fixautomodel")
require("commands.sort_columns")
require("commands.buf_only")
require("commands.toggle_cursor_line")
