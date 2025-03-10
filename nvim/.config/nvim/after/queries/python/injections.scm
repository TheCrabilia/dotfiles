; extends

(call
  (identifier) @_id (#eq? @_id "gql")
  (argument_list
    (string
      (string_content) @injection.content
    )
  )

  (#set! injection.language "graphql")
)
