syntax clear

" Read the C syntax to start with
runtime syntax/c.vim
unlet b:current_syntax

syntax keyword cppKeyword	new delete this throw
syntax keyword cppStatement	template operator friend typename
syntax keyword cppScopeDecl	public protected private
syntax keyword cppType		inline virtual bool
" syntax keyword cppExceptions	throw try catch
syntax match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast[ 	]*<"he=e-1
syntax match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast[ 	]*$"
syntax keyword cppCast		explicit
syntax keyword cppStorageClass	mutable
syntax keyword cppNumber	NPOS
syntax keyword cppBoolean	true false

syntax match cppClassPreDecl	"^[ \t]*class[ 	][ 	]*[a-zA-Z_][a-zA-Z0-9_:]*[ 	]*;"
syntax match cppClassDecl	    "^[ \t]*class[ 	][ 	]*[a-zA-Z_][a-zA-Z0-9_]*"

" Functions ... 
syntax match cppFunction  "^[a-zA-Z_][a-zA-Z0-9_<>:]*("he=e-1
syntax match cppMethod  "^[a-zA-Z_][a-zA-Z0-9_<>:]*::\~\=[a-zA-Z0-9_<>:]\+("he=e-1

syntax match cppMethodWrapped contained  "[a-zA-Z_][a-zA-Z0-9_<>:]*::[a-zA-Z0-9_<>:]\+" 
syntax match cppMethodWrap  "^[a-zA-Z_][a-zA-Z0-9_<>:]*[ 	][ 	]*[a-zA-Z_][a-zA-Z0-9_<>:]*::[a-zA-Z0-9_<>:]\+("he=e-1 contains=cppMethodWrapped

syntax match cppNamespaceName   contained "[a-zA-Z_][a-zA-Z0-9_]*;"he=e-1
syntax match cppNamespace contained  "namespace [a-zA-Z_][a-zA-Z0-9_]*;"he=e-1 contains=cppNamespaceName
syntax match cppUsingNamespace  "^using namespace [a-zA-Z_][a-zA-Z0-9_]*;"he=e-1 contains=cppNamespace

syntax match cppTry  "^[ \t]*try[ \t]*{"he=e-1
syntax match cppCatch  "^[ \t]*catch[ \t]*("he=e-1

if !exists("did_cpp_syntax_inits")
  let did_cpp_syntax_inits = 1
  highlight link cppClassDecl	Typedef
  highlight link cppClassPreDecl	cppStatement
  highlight link cppScopeDecl	cppStatement
  highlight link cppCast	cppStatement
  highlight link cppExceptions	cppStatement
  highlight link cppMethod	cppFunction
  highlight link cppStatement	Statement
  highlight link cppType	Type
  highlight link cppMethod	Function
  highlight link cppFunction	Function
  highlight link cppStorageClass	StorageClass
  highlight link cppNumber	Number
  highlight link cppBoolean	Boolean
  highlight link cppNamespaceName	Boolean
"   highlight link cppNamespace	Defined
  highlight link cppUsingNamespace	Include
  highlight link cppTry	Keyword
  highlight link cppKeyword	Keyword
  highlight link cppCatch	Keyword
endif

let b:current_syntax = "cpp"
