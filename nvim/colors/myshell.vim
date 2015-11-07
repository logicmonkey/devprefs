" Vim color file
" Maintainer: Walyd Ali
" Last Change:


set bg=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "myshell"

hi Normal         guifg=#bdbdbd     guibg=#000000     ctermfg=lightgray ctermbg=black
hi ErrorMsg       guifg=#ffffff     guibg=#287eff     ctermfg=white     ctermbg=lightblue
hi Visual         guifg=#808080     guibg=bg          ctermfg=lightblue ctermbg=fg           gui=reverse             cterm=reverse
hi VisualNOS      guifg=#808080     guibg=bg          ctermfg=lightblue ctermbg=fg           gui=reverse,underline   cterm=reverse,underline
hi Todo           guifg=#d14a14     guibg=#1248d1     ctermfg=red       ctermbg=darkblue
hi Search         guifg=#90fff0     guibg=#313131     ctermfg=fg        ctermbg=bg                                   cterm=bold
hi IncSearch      guifg=#b0ffff     guibg=#2050d0     ctermfg=lightblue ctermbg=white

hi SpecialKey     guifg=cyan                          ctermfg=darkcyan
hi Directory      guifg=cyan                          ctermfg=cyan
hi Title          guifg=magenta                       ctermfg=magenta                        gui=none                cterm=bold
hi WarningMsg     guifg=red                           ctermfg=red
hi WildMenu       guifg=yellow      guibg=black       ctermfg=yellow    ctermbg=black                                cterm=none                 term=none
hi ModeMsg        guifg=#22cce2                       ctermfg=lightblue
hi MoreMsg                                            ctermfg=darkgreen
hi Question       guifg=green                         ctermfg=green                          gui=none                cterm=none
hi NonText        guifg=#0030ff                       ctermfg=darkblue

hi StatusLine     guifg=lightblue   guibg=black       ctermfg=lightblue ctermbg=black        gui=italic              cterm=none                 term=none
hi StatusLineNC   guifg=black       guibg=darkgray    ctermfg=black     ctermbg=gray         gui=none                cterm=none                 term=none
hi VertSplit      guifg=black       guibg=darkgray    ctermfg=black     ctermbg=gray         gui=none                cterm=none                 term=none

hi Folded         guifg=#808080     guibg=#000040     ctermfg=darkgrey  ctermbg=black                                cterm=bold                 term=bold
hi FoldColumn     guifg=#808080     guibg=#000040     ctermfg=darkgrey  ctermbg=black                                cterm=bold                 term=bold
hi LineNr         guifg=#804000                       ctermfg=brown                          gui=none                cterm=none

hi DiffAdd                          guibg=darkblue                      ctermbg=darkblue                             cterm=none                 term=none
hi DiffChange                       guibg=darkmagenta                   ctermbg=magenta                              cterm=none
hi DiffDelete     guifg=Blue        guibg=DarkCyan    ctermfg=blue      ctermbg=cyan         gui=bold
hi DiffText                         guibg=Red                           ctermbg=red          gui=bold                cterm=bold

hi Cursor         guifg=black       guibg=grey        ctermfg=black     ctermbg=white
hi iCursor        guifg=black       guibg=grey        ctermfg=black     ctermbg=white

hi CursorLine                       guibg=#303030                                                                    cterm=bold
hi CursorColumn                     guibg=#303030

hi Comment        guifg=#05b105                       ctermfg=darkgreen                      gui=none                cterm=none
hi Constant       guifg=#bb0000                       ctermfg=red                                                    cterm=none
hi Special        guifg=#aa5500                       ctermfg=brown                          gui=none                cterm=none
hi Identifier     guifg=#00aaaa                       ctermfg=cyan                                                   cterm=none
hi Statement      guifg=#218df5                       ctermfg=blue                           gui=none                cterm=none
hi PreProc        guifg=#cdcd00                       ctermfg=yellow                         gui=none                cterm=bold
hi PreProcComment guifg=#cdcd00                       ctermfg=yellow                         gui=none                cterm=bold
hi Type           guifg=#ffa0a0                       ctermfg=cyan      ctermbg=bg           gui=none                cterm=none
hi Underlined                                                                                                        cterm=underline            term=underline
hi Ignore         guifg=bg                            ctermfg=bg
hi Define         guifg=#804000                       ctermfg=brown                          gui=none                cterm=none
hi Function                                           ctermfg=cyan      ctermbg=bg           gui=none                cterm=none

" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0
