vim.cmd([[
function! FixAutoModel(model)
exe '%s/const Sequelize = require("sequelize");\nmodule.exports = function (sequelize, DataTypes) {\n.*return sequelize.define(/const ' . a:model . ' = crm.define(/g'
:%s/};//g
:%s/DataTypes/Sequelize/g
" exe ':%s/' . a:prefix . '\zs[A-Z]\ze/\l&/g'
" exe '%s/' . a:prefix . '//gI'
exe ':file api/src/data/crm/models/' . a:model . '.model.js'
:w
endfunction
]])
