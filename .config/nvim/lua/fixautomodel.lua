vim.cmd([[
function! FixAutoModel(model, prefix)
exe '%s/const Sequelize = require("sequelize");\nmodule.exports = function (sequelize, DataTypes) {\n.*return sequelize.define(/const ' . a:model . ' = db.define(/g'
:%s/};//g
:%s/DataTypes/Sequelize/g
exe ':%s/' . a:prefix . '\zs[A-Z]\ze/\l&/g'
exe '%s/' . a:prefix . '//gI'
exe ':file src/lib/data/models/' . a:model . '.model.js'
:w
endfunction
]])


