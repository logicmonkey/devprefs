syntax clear

syntax match  textSharpBang "^#!.\+$" 
syntax match  textComment   "^#\([^!].*\)\=$\|[ \t]#.*"

if !exists("did_text_syntax_inits")
  let did_text_syntax_inits = 1
  highlight link textSharpBang          PreProc
  highlight link textComment            Comment
endif

let b:current_syntax = "text"
