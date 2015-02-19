syntax clear

syntax region  synopsysString     oneline start=+"+  skip=+\\"+  end=+"+

syntax region  synopsysComment    start="/\*"  end="\*/"
syntax match   synopsysComment    "//.*"

syntax keyword synopsysKeyword    contained alias unalias
syntax match   synopsysAliased    "^[ \t]*\(unalias\|alias\)[ \t]\+[a-zA-Z_][a-zA-Z_0-9]*[ \t]*" contains=synopsysKeyword

syntax sync ccomment synopsysComment minlines=10

if !exists("did_synopsys_syntax_inits")
  let did_synopsys_syntax_inits = 1
  highlight link synopsysComment           Comment
  highlight link synopsysString            String
  highlight link synopsysKeyword           Keyword
  highlight link synopsysAliased           Defined
endif

let b:current_syntax = "synopsys"
