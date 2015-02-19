syntax clear

syntax keyword ndlKeyword   define annotations

syntax match   ndlEndModule   "^end module"

syntax keyword ndlStorageClass   inputs outputs

syntax region  ndlString       oneline start=+"+  skip=+\\\\\|\\"+  end=+"+

syntax region  ndlComment      start="/\*"  end="\*/"

syntax keyword ndlKeyword   contained module
syntax match   ndlModName   contained "[a-zA-Z-_][a-zA-Z_0-9]*"
syntax match   ndlModLine   transparent "^[ \t]*module[ \t]\+[a-zA-Z-_][a-zA-Z_0-9]*\>" contains=ndlKeyword,ndlModName

syntax keyword ndlKeyword   contained level
syntax match   ndlLevName   contained "[a-zA-Z-_][a-zA-Z_0-9]*"
syntax match   ndlLevLine   transparent "^[ \t]*level[ \t]\+[a-zA-Z-_][a-zA-Z_0-9]*\>" contains=ndlKeyword,ndlLevName

if !exists("did_ndl_syntax_inits")
  let did_ndl_syntax_inits = 1

  highlight link ndlString          String
  highlight link ndlComment         Comment
  highlight link ndlKeyword         Keyword
  highlight link ndlEndModule       Keyword
  highlight link ndlModName         Function
  highlight link ndlLevName         StorageClass
  highlight link ndlStorageClass    StorageClass
endif

let b:current_syntax = "lsi"
