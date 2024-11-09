;; extends

(let_binding
  (value_identifier) @function
  (function))

(value_identifier_path
  (module_identifier) 
  (value_identifier) @function)

(call_expression
    (value_identifier) @function)

((value_identifier_path
  (module_identifier_path)
  (value_identifier) @function)
 (arguments))


