syntax clear

syntax include @Pod $VIMRUNTIME/syntax/pod.vim
syntax region perlPOD start="^=[a-z]" end="^=cut" contains=@Pod,perlTodo keepend

syntax keyword perlControl        BEGIN END
syntax keyword perlStorageClass   my local
syntax keyword perlKeyword        goto return last next
syntax keyword perlKeyword        case default
syntax keyword perlKeyword        if elsif unless else switch
syntax keyword perlKeyword        while for foreach do until
syntax keyword perlKeyword        defined undef
syntax keyword perlKeyword        and or not

syntax keyword perlPackage  package contained
syntax match   perlPackLine "^[ \t]*package\>[ \t]\+[^; \t]\+" contains=perlPackage

syntax keyword perlUse  no use require contained
syntax match   perlUseLine "^[ \t]*\(use\>\|require\>\|no\>\)[ \t]\+[^; \t]\+" contains=perlUse

syntax region  perlString oneline start=+"+  skip=+\\"+  end=+"+
syntax region  perlString oneline start=+'+  skip=+\\'+  end=+'+

syntax match  perlSharpBang "^#!.\+$" 
syntax match  perlComment   "^#\([^!].*\)\=$\|[ \t]#.*"

syntax region perlSubName start=+^[ \t]*sub[ \t]\++hs=e+1 end=+[({]+he=s-1

" syntax region perlSubLine start="^[ \t]*sub[ \t]\+" matchgroup=perlSubName end="[a-zA-Z_][a-zA-Z_0-9]*[ \t\n]*[{(]"he=e-2

if !exists("did_perl_syntax_inits")
  let did_perl_syntax_inits = 1
  highlight link perlSharpBang          PreProc
  highlight link perlString             String
  highlight link perlComment            Comment
  highlight link perlSubName            Function
  highlight link perlKeyword            Keyword
  highlight link perlInclude            Include
  highlight link perlPackage            Include
  highlight link perlPackLine           Function
  highlight link perlUse                Include
  highlight link perlPOD                Comment
  highlight link perlUseLine            Defined
  highlight link perlControl            PreProc
  highlight link perlStorageClass       StorageClass
endif

syn sync match perlSyncPOD grouphere perlPOD "^=pod"
syn sync match perlSyncPOD grouphere perlPOD "^=head"
syn sync match perlSyncPOD grouphere perlPOD "^=item"
syn sync match perlSyncPOD grouphere NONE "^=cut"

let b:current_syntax = "perl"
