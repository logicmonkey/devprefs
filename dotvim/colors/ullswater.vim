""
" Colorscheme: " Author: logicmonkey" License: MIT""

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name="ullswater"


let Italic = ""
if exists('g:ullswater_italic')
  let Italic = "italic"
endif
let g:ullswater_italic = get(g:, 'ullswater_italic', 0)

let Bold = ""
if exists('g:ullswater_bold')
  let Bold = "bold"
endif

let g:ullswater_bold = get(g:, '_bold', 0)

  hi ColorColumn guifg=NONE ctermfg=NONE guibg=#323232 ctermbg=236 gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE ctermfg=NONE guibg=#323232 ctermbg=236 gui=NONE cterm=NONE
  hi CursorLine guifg=NONE ctermfg=NONE guibg=#323232 ctermbg=236 gui=NONE cterm=NONE
  hi CursorLineNr guifg=#73cef4 ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Directory guifg=#b3deef ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
  hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
  hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
  hi ErrorMsg guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=NONE ctermfg=NONE guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
  hi Folded guifg=#666666 ctermfg=242 guibg=#202020 ctermbg=234 gui=NONE cterm=NONE
  hi FoldColumn guifg=#666666 ctermfg=242 guibg=#202020 ctermbg=234 gui=NONE cterm=NONE
  hi SignColumn guifg=#999999 ctermfg=246 guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
  hi IncSearch guifg=#ffffff ctermfg=15 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
  hi LineNr guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi MatchParen guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Normal guifg=#00af5f ctermfg=35 guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
  hi PMenu guifg=#dadada ctermfg=253 guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
  hi PMenuSel guifg=#335261 ctermfg=239 guibg=#c9d05c ctermbg=185 gui=NONE cterm=NONE
  hi PmenuSbar guifg=#335261 ctermfg=239 guibg=#c9d05c ctermbg=185 gui=NONE cterm=NONE
  hi PmenuThumb guifg=#335261 ctermfg=239 guibg=#c9d05c ctermbg=185 gui=NONE cterm=NONE
  hi Question guifg=#c9d05c ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Search guifg=#ffffff ctermfg=15 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
  hi SpecialKey guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi SpellBad guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi SpellLocal guifg=#d3b987 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi SpellCap guifg=#ffc24b ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi SpellRare guifg=#73cef4 ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=#1d1d1d ctermfg=234 guibg=#666666 ctermbg=242 gui=NONE cterm=NONE
  hi StatusLineNC guifg=#999999 ctermfg=246 guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
  hi TabLine guifg=#999999 ctermfg=246 guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE ctermfg=NONE guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
  hi TabLineSel guifg=#c9d05c ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Title guifg=#b3deef ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Visual guifg=NONE ctermfg=NONE guibg=#293b44 ctermbg=237 gui=NONE cterm=NONE
  hi VisualNOS guifg=NONE ctermfg=NONE guibg=#293b44 ctermbg=237 gui=NONE cterm=NONE
  hi WarningMsg guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi WildMenu guifg=#282828 ctermfg=235 guibg=#c9d05c ctermbg=185 gui=NONE cterm=NONE
  hi Comment guifg=#af5f00 ctermfg=130 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Constant guifg=#0087d7 ctermfg=32 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi String guifg=#5f8787 ctermfg=66 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Character guifg=#00ff5f ctermfg=47 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Function guifg=#b3deef ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Statement guifg=#5f8787 ctermfg=66 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Conditional guifg=#00ff5f ctermfg=47 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Repeat guifg=#00ff5f ctermfg=47 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Label guifg=#d3b987 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Operator guifg=#c9d05c ctermfg=185 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Define guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Type guifg=#00ff5f ctermfg=47 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Special guifg=#d3b987 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  hi Todo guifg=#f43753 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

