vim.cmd([[
function! BufRuleDoc()
exe 'bufdo s/\(.*\).prototype.\(.*\) = \(.*\)/\/**\r* @openapi\r* \/api\/\l\1\/\2:\r*   get:\r*     tags: [\1]\r*\/\r\1.prototype.\2 = \3'
:w
endfunction
]])
