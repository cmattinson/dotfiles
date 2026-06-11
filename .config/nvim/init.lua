vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.lazy")
require("config.keymaps")
require("config.sets")
require("config.winbar")
require("config.colorscheme")
-- require("config.lsp")
require("functions.cleanservice")
require("functions.fixautomodel")
require("commands")
