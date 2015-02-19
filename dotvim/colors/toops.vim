" Vim color file
" Maintainer: Ali Rabbani
" Last Change:

" toops -- for those who prefer dark background

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "toops"
" TODO
" hi Normal         guifg=#eeeeee     guibg=#000000     ctermfg=lightgray ctermbg=black
hi Normal         guifg=#bdbdbd     guibg=#000000                             ctermfg=lightgray    ctermbg=black
hi ErrorMsg       guifg=#ffffff     guibg=#287eff                             ctermfg=white        ctermbg=lightblue
hi Visual         guifg=#808080     guibg=bg          gui=reverse             ctermfg=lightblue    ctermbg=fg           cterm=reverse
hi VisualNOS      guifg=#808080     guibg=bg          gui=reverse,underline   ctermfg=lightblue    ctermbg=fg           cterm=reverse,underline
hi Todo           guifg=#d14a14     guibg=#1248d1     gui=NONE                ctermfg=red          ctermbg=darkblue
hi Search         guifg=#90fff0     guibg=#313131                             ctermfg=white        ctermbg=darkblue     cterm=underline            term=underline
hi IncSearch      guifg=#b0ffff     guibg=#2050d0                             ctermfg=darkblue     ctermbg=gray

hi SpecialKey     guifg=cyan                                                  ctermfg=darkcyan
hi Directory      guifg=cyan                                                  ctermfg=cyan
hi Title          guifg=magenta                       gui=none                ctermfg=magenta                           cterm=bold
hi WarningMsg     guifg=red                                                   ctermfg=red
hi WildMenu       guifg=yellow      guibg=black                               ctermfg=yellow       ctermbg=black        cterm=none                 term=none
hi ModeMsg        guifg=#22cce2                                               ctermfg=lightblue
hi MoreMsg                                                                    ctermfg=darkgreen
hi Question       guifg=green                         gui=none                ctermfg=green                             cterm=none
hi NonText        guifg=#0030ff                                               ctermfg=darkgrey

hi StatusLine     guifg=lightblue   guibg=black       gui=italic              ctermfg=lightblue    ctermbg=black        cterm=none                 term=none
hi StatusLineNC   guifg=black       guibg=darkgray    gui=none                ctermfg=black        ctermbg=gray         cterm=none                 term=none
hi VertSplit      guifg=black       guibg=darkgray    gui=none                ctermfg=black        ctermbg=gray         cterm=none                 term=none

hi Folded         guifg=#808080     guibg=#000040                             ctermfg=darkgrey     ctermbg=black        cterm=bold                 term=bold
hi FoldColumn     guifg=#808080     guibg=#000040                             ctermfg=darkgrey     ctermbg=black        cterm=bold                 term=bold
hi LineNr         guifg=#804000                       gui=italic              ctermfg=brown

hi DiffAdd                          guibg=darkblue                                                 ctermbg=darkblue     cterm=none                 term=none
hi DiffChange                       guibg=darkmagenta                                              ctermbg=magenta      cterm=none
hi DiffDelete     guifg=Blue        guibg=DarkCyan    gui=bold                ctermfg=blue         ctermbg=cyan
hi DiffText                         guibg=Red         gui=bold                                     ctermbg=red          cterm=bold

hi Cursor         guifg=black       guibg=grey                                ctermfg=black        ctermbg=white
hi iCursor        guifg=black       guibg=grey                                ctermfg=black        ctermbg=white

hi CursorLine                       guibg=#303030                                                                       cterm=bold
hi CursorColumn                     guibg=#303030

hi Comment        guifg=#05b105                       gui=italic              ctermfg=darkgreen                         cterm=none
hi Constant       guifg=#bb0000                                               ctermfg=red                               cterm=none
hi Special        guifg=Orange                        gui=none                ctermfg=brown                             cterm=none
hi Identifier     guifg=#40ffff                                               ctermfg=cyan                              cterm=none
hi Statement      guifg=#0060ff                       gui=none                ctermfg=blue                              cterm=none
hi PreProc        guifg=#cdcd00                       gui=none                ctermfg=brown                             cterm=none
hi PreProcComment guifg=#cdcd00                       gui=italic              ctermfg=brown                             cterm=none
hi type           guifg=#aa00aa                       gui=none                ctermfg=magenta                           cterm=none
hi Underlined                                                                                                           cterm=underline            term=underline
hi Ignore         guifg=bg                                                    ctermfg=bg


" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0
