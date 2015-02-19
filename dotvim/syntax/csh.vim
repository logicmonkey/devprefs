syntax clear

syntax keyword shKeyword    contained setenv alias unsetenv
syntax match   shSetenv     "^[ \t]*\(setenv\|unsetenv\|alias\)[ \t]\+[a-zA-Z_][a-zA-Z_0-9]*[ \t]*" contains=shKeyword

syntax keyword shKeyword    bg break breaksw case complete continue
syntax keyword shKeyword    echo eval exec exit foreach end glob goto
syntax keyword shKeyword    if else endif limit repeat set 
syntax keyword shKeyword    shift source switch endsw time umask 
syntax keyword shKeyword    unalias unhash ulimit unset wait
syntax keyword shKeyword    while

syntax match   shComment    "#.*$"

if !exists("did_csh_syntax_inits")
  let did_csh_syntax_inits = 1
  highlight link shComment           Comment
  highlight link shKeyword           Keyword
  highlight link shSetenv            Defined
endif

let b:current_syntax = "csh"
