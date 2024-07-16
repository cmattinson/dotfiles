vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.lazy")
require("config.keymaps")
require("config.sets")
require("functions.fixautomodel")
require("functions.ruledoc")
require("functions.bufruledoc")
require("functions.subruledoc")
require("functions.bufsubruledoc")
require("functions.authorize")
require("commands.SortColumns")
