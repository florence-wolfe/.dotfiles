; Alpine.js x-* attribute injection for Astro files
; extends
(attribute 
  (attribute_name) @_alpine_attr
  (quoted_attribute_value 
    (attribute_value) @injection.content)
  (#match? @_alpine_attr "^x-|^\\@")
  (#set! injection.language "javascript"))

(attribute 
  (attribute_name) @_alpine_attr
  (attribute_interpolation
    (attribute_js_expr) @injection.content
  )
  (#match? @_alpine_attr "^x-|^\\@")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "javascript")
)

