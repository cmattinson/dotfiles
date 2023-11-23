vim.cmd([[
function! FixAutoModel(model, prefix, store)
exe '%s/const Sequelize = require("sequelize");\nmodule.exports = function (sequelize, DataTypes) {\n.*return sequelize.define(/const ' . a:model . ' = '. a:store . '.define(/g'
:%s/};//g
:%s/DataTypes/Sequelize/g
exe ':%s/' . a:prefix . '\zs[A-Z]\ze/\l&/g'
exe '%s/' . a:prefix . '//gI'
exe ':file src/lib/services/contact/models/' . a:model . '.model.js'
:w
endfunction
]])
