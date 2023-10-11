vim.cmd([[
function!   SequelizeToGraphQL()
	:%s/{ type: Sequelize.INTEGER }/Int/g
	:%s/{ type: Sequelize.INTEGER(.*) }/Int/g
	:%s/{ type: Sequelize.STRING(.*) }/String/g
	:%s/{ type: Sequelize.CHAR(.*) }/String/g
	:%s/{ type: Sequelize.TEXT }/String/g
	:%s/{ type: Sequelize.BOOLEAN }/Boolean/g
	:%s/{ type: Sequelize.DATE }/Date/g
	:%s/ref.*: \zsInt\ze/ReferenceField/gc
endfunction

command! SequelizeToGraphQL         call SequelizeToGraphQL()
]])
