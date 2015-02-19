syntax clear

syntax keyword cKeyword            break case continue default do
syntax keyword cKeyword            else for goto if return switch while

syntax region  cString     oneline start=+"+  skip=+\\"+  end=+"+

syntax region  cComment            start="/\*"  end="\*/"
syntax match   cComment            "//.*"

syntax region  cIncludeLine oneline matchgroup=cInclude start="^#\s*include\>" matchgroup=cIncluded end="\S\+"

syntax match   cCharacter      "L\='[^']\{1,2}'"

syntax match   cCPPKeyword         contained "^#\s*\(define\>\|undef\>\)"
syntax match   cCPPKeyword         contained "^#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|endif\>\)"
syntax match   cDefined            contained "\h\w*"
syntax match   cDefinedSpecChar    contained "[()|]"
syntax match   cDefinedFunc        contained "defined(" contains=cDefinedSpecChar
syntax match   cDefine             "^#\s*\(define\>\|undef\>\)\s\+\h\w*" contains=cCPPKeyword,cDefined
syntax match   cDefine             "^#\s*\(else\>\|endif\>\)"
syntax match   cDefine             "^#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\)\s\+.\+" contains=cCPPKeyword,cDefined,cDefinedFunc,cDefinedSpecChar

syntax match   cPreProc            "^#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)"

syntax keyword cTypeDefStruct typedef struct  contained
syntax match  cStructName "^\s*typedef\s\+struct\s\+\h\w*\s*{"he=e-1  contains=cTypeDefStruct
syntax match  cStructName "^\s*typedef\s\+\h\w*\s*{"he=e-1  contains=cTypeDefStruct
syntax match  cStructName "^\s*struct\s\+\h\w*\s*{"he=e-1  contains=cTypeDefStruct

syntax match  cTagName "^}\s*\h\w*\s*;"hs=s+1,he=e-1

syntax region  cFuncLine oneline start="^\h" matchgroup=cFuncProto end="\h\w*\s*("he=e-1

syntax match cFuncDef "^\h\w*\s*("he=e-1

syntax match cClassKeyword "^\s*\(public\|private\)"

syntax sync ccomment cComment minlines=10

if !exists("did_c_syntax_inits")
  let did_c_syntax_inits = 1
  highlight link cComment           Comment
  highlight link cKeyword           Keyword
  highlight link cString            String
  highlight link cPreProc           PreProc
  highlight link cDefine            Define
  highlight link cDefinedFunc       Define
  highlight link cCPPKeyword        Define
  highlight link cCharacter         String
  highlight link cInclude           Include
  highlight link cDefined           Defined
  highlight link cStructName        Defined
  highlight link cTagName           Function
  highlight link cFuncProto         Defined
  highlight link cFuncDef           Function
  highlight link cClassKeyword      StorageClass
endif

let b:current_syntax = "c"
