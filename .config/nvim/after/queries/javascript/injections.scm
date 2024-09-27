; extends
(call_expression
  (member_expression
    object: (identifier) @object (#eq? object "crm")
    property: (property_identifier) @property (#eq? @property "query"))
    (arguments
      (template_string
      (string_fragment) @injection.content)
      (#set! injection.language "sql"))
    )
