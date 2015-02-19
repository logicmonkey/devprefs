syntax clear

syntax keyword tclStorageClass    global set unset
syntax keyword tclKeyword         clock exit for incr list package regsub split
syntax keyword tclKeyword         unknown after close expr foreach info llength pid
syntax keyword tclKeyword         rename string append concat fblocked format
syntax keyword tclKeyword         interp load pkg_mkIndex return subst update array
syntax keyword tclKeyword         continue fconfigure gets join lrange scan
syntax keyword tclKeyword         switch uplevel bgerror eof file glob lappend
syntax keyword tclKeyword         lreplace puts seek tclvars upvar break error
syntax keyword tclKeyword         fileevent library lsearch pwd tell
syntax keyword tclKeyword         vwait catch eval filename history lindex lsort
syntax keyword tclKeyword         read socket time while cd exec flush if linsert
syntax keyword tclKeyword         open regexp source trace 
syntax keyword tclKeyword         else default elseif

syntax region  tclString  oneline start=+"+  skip=+\\"+  end=+"+

" Comments. That's nearly simple : # is a comment. Especially when at the
" beginning of a line or after a space (avoid m## case ...)
syntax match  tclSharpBang         "^#!.\+$" 
syntax match  tclComment         "^#\([^!].*\)\=$\|[ \t]#.*"

" Functions ... 
" find ^proc foo { . Only highlight foo.
syntax region tclFunction start=+^[ \t]*proc[ \t]\++hs=e+1 end=+{+he=s-1

if !exists("did_tcl_syntax_inits")
  let did_tcl_syntax_inits = 1

  highlight link tclSharpBang          PreProc
  highlight link tclString             String
  highlight link tclComment            Comment
  highlight link tclFunction           Function
  highlight link tclKeyword            Keyword
  highlight link tclInclude            Include
  highlight link tclPackage            Include
  highlight link tclControl            PreProc
  highlight link tclStorageClass       StorageClass
endif

let b:current_syntax = "tcl"
