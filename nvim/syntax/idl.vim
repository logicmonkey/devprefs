" Vim syntax file
" Language:     IDL
" Maintainer:   Ali

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Use the C-Preprocessor cpp to generate different def files.
syn match idlcDefineComment contained /#endif .*$/ms=s+6
syn match idlcDefine /^\s*#\(ifdef\|if\|elif\) .*$/
syn match idlcDefine /^\s*#\(endif\|else\).*$/ contains=defcDefineComment
" syn match cDefine /^\s*#\(endif\|else\).*$/ contains=cDefineComment


" case is not significant
" syn case ignore


" IDL keywords
syn keyword idlTokens
         \ accesswidth
         \ activehigh
         \ activelow
         \ addressing
         \ addrmap
         \ alias
         \ alignment
         \ all
         \ anded
         \ arbiter
         \ async
         \ bigendian
         \ boolean
         \ bothedge
         \ bridge
         \ compact
         \ component
         \ constant
         \ counter
         \ decr
         \ decrsaturate
         \ decrthreshold
         \ decrvalue
         \ decrwidth
         \ default
         \ desc
         \ dontcompare
         \ donttest
         \ encode
         \ encoding
         \ enum
         \ errextbus
         \ external
         \ false
         \ field
         \ fieldwidth
         \ format
         \ fullalign
         \ group
         \ halt
         \ haltenable
         \ haltmask
         \ hw
         \ hwclr
         \ hwenable
         \ hwmask
         \ hwset
         \ image
         \ incr
         \ incrvalue
         \ incrwidth
         \ initial
         \ interface
         \ internal
         \ intr
         \ level
         \ littleendian
         \ lsb0
         \ mask
         \ master
         \ module
         \ monitor
         \ msb0
         \ na
         \ name
         \ negedge
         \ next
         \ nonsticky
         \ number
         \ ored
         \ overflow
         \ package
         \ parameter
         \ param
         \ phase
         \ port
         \ posedge
         \ postfix
         \ precedence
         \ prefix
         \ property
         \ protocol
         \ rclr
         \ ref
         \ reg
         \ regalign
         \ regfile
         \ regwidth
         \ resetsignal
         \ rset
         \ rsvdset
         \ rsvdsetX
         \ rw
         \ saturate
         \ shared
         \ sharedextbus
         \ signal
         \ signalwidth
         \ singlepulse
         \ slave
         \ source
         \ sticky
         \ stickybit
         \ string
         \ suffix
         \ sw
         \ swacc
         \ swmod
         \ swwe
         \ swwel
         \ sync
         \ threshold
         \ true
         \ type
         \ underflow
         \ union
         \ use
         \ w
         \ we
         \ wel
         \ woclr
         \ woset
         \ wr
         \ xored

" " Special match for "if" and "else" since "else if" shouldn't be highlighted.
" " The right keyword is "elsif"
" syn match   idlStatement "\<\(if\|else\)\>"
" syn match   idlNone      "\<else\s\+if\>$"
" syn match   idlNone      "\<else\s\+if\>\s"

" " Predifined IDL types
" syn keyword idlType bit bit_vector
" syn keyword idlType character boolean integer real time
" syn keyword idlType string severity_level
" " Predifined standard ieee IDL types
" syn keyword idlType positive natural signed unsigned
" syn keyword idlType line text
" syn keyword idlType std_logic std_logic_vector
" syn keyword idlType std_ulogic std_ulogic_vector
" " Predefined non standard IDL types for Mentor Graphics Sys1076/QuickHDL
" syn keyword idlType qsim_state qsim_state_vector
" syn keyword idlType qsim_12state qsim_12state_vector
" syn keyword idlType qsim_strength
" " Predefined non standard IDL types for Alliance VLSI CAD
" syn keyword idlType mux_bit mux_vector reg_bit reg_vector wor_bit wor_vector
"
" " array attributes
" syn match idlAttribute "\'high"
" syn match idlAttribute "\'left"
" syn match idlAttribute "\'length"
" syn match idlAttribute "\'low"
" syn match idlAttribute "\'range"
" syn match idlAttribute "\'reverse_range"
" syn match idlAttribute "\'right"
" syn match idlAttribute "\'ascending"
" " block attributes
" syn match idlAttribute "\'behaviour"
" syn match idlAttribute "\'structure"
" syn match idlAttribute "\'simple_name"
" syn match idlAttribute "\'instance_name"
" syn match idlAttribute "\'path_name"
" syn match idlAttribute "\'foreign"
" " signal attribute
" syn match idlAttribute "\'active"
" syn match idlAttribute "\'delayed"
" syn match idlAttribute "\'event"
" syn match idlAttribute "\'last_active"
" syn match idlAttribute "\'last_event"
" syn match idlAttribute "\'last_value"
" syn match idlAttribute "\'quiet"
" syn match idlAttribute "\'stable"
" syn match idlAttribute "\'transaction"
" syn match idlAttribute "\'driving"
" syn match idlAttribute "\'driving_value"
" " type attributes
" syn match idlAttribute "\'base"
" syn match idlAttribute "\'high"
" syn match idlAttribute "\'left"
" syn match idlAttribute "\'leftof"
" syn match idlAttribute "\'low"
" syn match idlAttribute "\'pos"
" syn match idlAttribute "\'pred"
" syn match idlAttribute "\'rightof"
" syn match idlAttribute "\'succ"
" syn match idlAttribute "\'val"
" syn match idlAttribute "\'image"
" syn match idlAttribute "\'value"
"
" syn keyword idlBoolean true false
"
" " for this vector values case is significant
" syn case match
" " Values for standard IDL types
" syn match idlVector "\'[0L1HXWZU\-\?]\'"
" " Values for non standard IDL types qsim_12state for Mentor Graphics Sys1076/QuickHDL
" syn keyword idlVector S0S S1S SXS S0R S1R SXR S0Z S1Z SXZ S0I S1I SXI
" syn case ignore
"
" syn match  idlVector "B\"[01_]\+\""
" syn match  idlVector "O\"[0-7_]\+\""
" syn match  idlVector "X\"[0-9a-f_]\+\""
" syn match  idlCharacter "'.'"
syn region idlString start=+"+  end=+"+
"
" " floating numbers
" syn match idlNumber "-\=\<\d\+\.\d\+\(E[+\-]\=\d\+\)\>"
" syn match idlNumber "-\=\<\d\+\.\d\+\>"
" syn match idlNumber "0*2#[01_]\+\.[01_]\+#\(E[+\-]\=\d\+\)\="
" syn match idlNumber "0*16#[0-9a-f_]\+\.[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="
" " integer numbers
syn match idlNumber "-\=\<\d\+\(E[+\-]\=\d\+\)\>"
syn match idlNumber "-\=\<\d\+\>"
syn match idlNumber "0*2#[01_]\+#\(E[+\-]\=\d\+\)\="
syn match idlNumber "0*16#[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="
" " operators
" syn keyword idlOperator and nand or nor xor xnor
" syn keyword idlOperator rol ror sla sll sra srl
" syn keyword idlOperator mod rem abs not
syn match   idlOperator "[&><=:+\-*\/|]"
syn match   idlSpecial  "[\[\].,;]"
" " time
" syn match idlTime "\<\d\+\s\+\(\([fpnum]s\)\|\(sec\)\|\(min\)\|\(hr\)\)\>"
" syn match idlTime "\<\d\+\.\d\+\s\+\(\([fpnum]s\)\|\(sec\)\|\(min\)\|\(hr\)\)\>"
"
" Comments
syn keyword idlTodo contained todo fixme
syn match   idlTodo /??/
syn match   idlTodo /!!/

syn region  idlComment start="/\*" end="\*/" contains=idlTodo
syn match   idlComment "//.*$" contains=idlTodo
syn match   idlTrailSpace display excludenl "\s\+$"

" syntax region idlPortMap start=+\S*\s*=>+ end=/\(,\|)\)/he=e-1 skipempty


" syn match idlPort /\S*\s*=>/me=e-2 skipwhite

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_idl_syntax_inits")
  if version < 508
    let did_idl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink idlcDefine        PreProc
  HiLink idlcDefineComment PreprocComment
  HiLink idlSpecial        Special
  HiLink idlTokens         Statement
  HiLink idlCharacter      String
  HiLink idlString         String
  HiLink idlVector         String
  HiLink idlBoolean        String
  HiLink idlComment        Comment
  HiLink idlNumber         String
  HiLink idlTime           String
  HiLink idlType           Type
  HiLink idlOperator       Type
  HiLink idlPortOp         Type
  HiLink idlGlobal         Error
  HiLink idlAttribute      Type
  HiLink idlPort           String
  HiLink synDirective      SpecialKey
  HiLink idlTodo           Todo
  HiLink idlPortMap        Error
  " HiLink idlTrailSpace Error

  delcommand HiLink
endif

let b:current_syntax = "idl"

" vim: ts=8
