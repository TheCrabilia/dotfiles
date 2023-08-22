; extends

(call
  function: (identifier) @_func (#eq? @_func "gql")
  arguments: (argument_list
    (string
      (string_content) @graphql
    )
  )
)
