; Alpine.js x-* attribute injection for Astro files
; extends
(attribute 
  (attribute_name) @_alpine_attr
  (quoted_attribute_value 
    (attribute_value) @injection.content)
  (#match? @_alpine_attr "^x-")
  (#set! injection.language "javascript"))

