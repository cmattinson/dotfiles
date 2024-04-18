vim.cmd([[
function! Authorize(permission)
exe '%s/\(prototype.* =\) \(async.*\)/\1{\rauthorize: ["' . a:permission . '"],\rrule: \2'
exe 'normal GI}'
:w
endfunction
]])
