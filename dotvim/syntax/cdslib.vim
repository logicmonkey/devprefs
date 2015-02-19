syntax clear

syntax keyword cdsKeyword    contained DEFINE UNDEFINE
syntax match   cdsLibname    "^[ \t]*\(DEFINE\|UNDEFINE\)[ \t]\+[a-zA-Z_][a-zA-Z_0-9]*[ \t]*" contains=cdsKeyword

syntax keyword cdsKeyword    INCLUDE

syntax match   cdsComment    "^--.*$"

if !exists("did_cdslib_syntax_inits")
  let did_cdslib_syntax_inits = 1
  highlight link cdsComment           Comment
  highlight link cdsKeyword           Keyword
  highlight link cdsLibname           Defined
endif

let b:current_syntax = "cdslib"
