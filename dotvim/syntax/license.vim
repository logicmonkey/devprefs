syntax clear

syntax match   licenseComment   "^#\([^!].*\)\=$\|[ \t]#.*"

syntax match   licenseDaemon   "\s\+\/\S\+"

syntax keyword licenseSERVER      contained SERVER
syntax match   licenseSERVERName  contained "\h\S*"
syntax match   licenseSERVERLine  transparent "^SERVER\s\+\h\S*\s\+" contains=licenseSERVER,licenseSERVERName

syntax keyword licenseFEATURE      contained FEATURE INCREMENT
syntax match   licenseFEATUREName  contained "\S\+"
syntax match   licenseFEATURELine  transparent "^\(FEATURE\|INCREMENT\)\s\+\S\+\s\+" contains=licenseFEATURE,licenseFEATUREName

syntax case ignore
syntax match   licenseDate "\d\d-\(jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\)-200\d"
syntax case match

if !exists("did_license_syntax_inits")
  let did_license_syntax_inits = 1

  highlight link licenseDate            Function
  highlight link licenseDaemon          Keyword
  highlight link licenseSERVERName      Keyword
  highlight link licenseFEATUREName     Keyword
  highlight link licenseComment         Comment
endif

let b:current_syntax = "license"
