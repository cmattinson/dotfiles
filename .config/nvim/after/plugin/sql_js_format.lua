-- local embedded_sql = vim.treesitter.parse_query(
-- 	"javascript",
-- 	[[
-- (expression_statement)
-- (assignment_expression)
-- function: (identifier) @function (#eq? @function "sql")
--     (arguments)
--     (template_string) @sql
-- ]]
-- )
