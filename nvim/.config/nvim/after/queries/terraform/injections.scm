; extends

(attribute
  (identifier) @_id (#eq? @_id "yaml_body")
  (expression
    (template_expr
      (heredoc_template
        (template_literal) @injection.content
      )
    )
  )

  (#set! injection.language "yaml")
)
