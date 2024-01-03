""
" Lightline_theme: ullswater


" Author: logicmonkey
" License: MIT
""

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {} }

let s:p.normal.left = [[["#eeeeee", 255], ["#ff8700", 208]], [["#eeeeee", 255], ["#af5f00", 130]]]
let s:p.normal.middle = [[["#eeeeee", 255], ["#202020", 234]]]
let s:p.normal.right = [[["#eeeeee", 255], ["#ff8700", 208]], [["#eeeeee", 255], ["#af5f00", 130]]]
let s:p.normal.error = [[["#eeeeee", 255], ["#f43753", 203]]]
let s:p.normal.warning = [[["#eeeeee", 255], ["#f43753", 203]]]

let s:p.inactive.left = [[["#dadada", 253], ["#1d1d1d", 234]], [["#dadada", 253], ["#1d1d1d", 234]]]
let s:p.inactive.middle = [[["#dadada", 253], ["#1d1d1d", 234]]]
let s:p.inactive.right = [[["#dadada", 253], ["#1d1d1d", 234]], [["#dadada", 253], ["#1d1d1d", 234]]]

let s:p.insert.left = [[["#1d1d1d", 234], ["#00ff5f", 47]], [["#1d1d1d", 234], ["#00af5f", 35]]]
let s:p.insert.middle = [[["#eeeeee", 255], ["#202020", 234]]]
let s:p.insert.right = [[["#1d1d1d", 234], ["#00ff5f", 47]], [["#1d1d1d", 234], ["#00af5f", 35]]]

let s:p.replace.left = [[["#1d1d1d", 234], ["#f43753", 203]], [["#eeeeee", 255], ["#c5152f", 160]]]
let s:p.replace.middle = [[["#eeeeee", 255], ["#202020", 234]]]
let s:p.replace.right = [[["#1d1d1d", 234], ["#f43753", 203]], [["#eeeeee", 255], ["#c5152f", 160]]]

let s:p.visual.left = [[["#1d1d1d", 234], ["#b3deef", 153]], [["#1d1d1d", 234], ["#73cef4", 81]]]
let s:p.visual.middle = [[["#eeeeee", 255], ["#202020", 234]]]
let s:p.visual.right = [[["#1d1d1d", 234], ["#b3deef", 153]], [["#1d1d1d", 234], ["#73cef4", 81]]]

let s:p.tabline.left = [[["#eeeeee", 255], ["#335261", 239]]]
let s:p.tabline.tabsel = [[["#eeeeee", 255], ["#ff8700", 208]]]
let s:p.tabline.middle = [[["#eeeeee", 255], ["#335261", 239]]]
let s:p.tabline.right = [[["#eeeeee", 255], ["#335261", 239]]]

let g:lightline#colorscheme#ullswater#palette = lightline#colorscheme#flatten(s:p)
