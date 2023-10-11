vim.cmd([[
function! FixAutoModel()
let file = expand("%:t")->split('\.')[0]
exe '%s/const Sequelize = require("sequelize");\nmodule.exports = function (sequelize, DataTypes) {\n.*return sequelize.define(/const ' . file . ' = db.define(/g'
:%s/};//g
endfunction

command! FixAutoModel call FixAutoModel()
]])
