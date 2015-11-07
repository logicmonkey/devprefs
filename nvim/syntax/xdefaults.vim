syntax clear

syntax match   XdefComment    "!.*$"
syntax match   XdefSeparator  ":"

syntax region  cIncludeLine oneline matchgroup=cInclude start="^#[ \t]*include\>" matchgroup=XdefIncluded end="[^ \t]\+"

syntax match   XdefCPPKeyword         contained "^#[ \t]*\(define\>\|undef\>\)"
syntax match   XdefCPPKeyword         contained "^#[ \t]*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|endif\>\)"
syntax match   XdefDefined            contained "[a-zA-Z0-9_]\+"
syntax match   XdefDefinedSpecChar    contained "[()|]"
syntax match   XdefDefinedFunc        contained "defined(" contains=XdefDefinedSpecChar
syntax match   XdefDefine             "^#[ \t]*\(define\>\|undef\>\)[ \t]\+[a-zA-Z0-9_]\+" contains=cCPPKeyword,cDefined
syntax match   XdefDefine             "^#[ \t]*\(else\>\|endif\>\)"
syntax match   XdefDefine             "^#[ \t]*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|endif\>\)[ \t]\+.\+" contains=XdefCPPKeyword,XdefDefined,XdefDefinedFunc,XdefDefinedSpecChar

syntax match   XdefPreProc            "^#[ \t]*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)"

if !exists("did_Xdef_syntax_inits")
  let did_Xdef_syntax_inits = 1
  highlight link XdefComment           Comment
  highlight link XdefPreProc           PreProc
  highlight link XdefDefine            Define
  highlight link XdefDefinedFunc       Define
  highlight link XdefCPPKeyword        Define
  highlight link XdefInclude           Include
  highlight link XdefDefined           Defined
  highlight link XdefSeparator         Function
endif

let b:current_syntax = "xdefaults"
