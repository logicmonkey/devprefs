#                                                            ,`\
# Script to remap the 24 bit colour entries in          ...    /
# a gvim colorscheme to the X11 palette               @ o o @.'
# Mapping selects the LUT entry that gives the      .' ( o )
# lowest overall error across RGB color channels   /  (     )
#                                                  .'  \ : /
# Output is a terminal friendly colorscheme           nnn nnn
#
#                                      Copyright 2021 Piers Barber

import sys
import re

def nearest256(color):
    LUT=[{'colname':'Black', 'hex':'#000000'},
        {'colname':'Maroon', 'hex':'#800000'},
        {'colname':'Green', 'hex':'#008000'},
        {'colname':'Olive', 'hex':'#808000'},
        {'colname':'Navy', 'hex':'#000080'},
        {'colname':'Purple', 'hex':'#800080'},
        {'colname':'Teal', 'hex':'#008080'},
        {'colname':'Silver', 'hex':'#c0c0c0'},
        {'colname':'Grey', 'hex':'#808080'},
        {'colname':'Red', 'hex':'#ff0000'},
        {'colname':'WebGreen', 'hex':'#00ff00'},
        {'colname':'Yellow', 'hex':'#ffff00'},
        {'colname':'Blue', 'hex':'#0000ff'},
        {'colname':'Magenta', 'hex':'#ff00ff'},
        {'colname':'Cyan', 'hex':'#00ffff'},
        {'colname':'White', 'hex':'#ffffff'},
        {'colname':'Grey0', 'hex':'#000000'},
        {'colname':'NavyBlue', 'hex':'#00005f'},
        {'colname':'DarkBlue', 'hex':'#000087'},
        {'colname':'Blue3', 'hex':'#0000af'},
        {'colname':'Blue3', 'hex':'#0000d7'},
        {'colname':'Blue1', 'hex':'#0000ff'},
        {'colname':'DarkGreen', 'hex':'#005f00'},
        {'colname':'DeepSkyBlue4', 'hex':'#005f5f'},
        {'colname':'DeepSkyBlue4', 'hex':'#005f87'},
        {'colname':'DeepSkyBlue4', 'hex':'#005faf'},
        {'colname':'DodgerBlue3', 'hex':'#005fd7'},
        {'colname':'DodgerBlue2', 'hex':'#005fff'},
        {'colname':'Green4', 'hex':'#008700'},
        {'colname':'SpringGreen4', 'hex':'#00875f'},
        {'colname':'Turquoise4', 'hex':'#008787'},
        {'colname':'DeepSkyBlue3', 'hex':'#0087af'},
        {'colname':'DeepSkyBlue3', 'hex':'#0087d7'},
        {'colname':'DodgerBlue1', 'hex':'#0087ff'},
        {'colname':'Green3', 'hex':'#00af00'},
        {'colname':'SpringGreen3', 'hex':'#00af5f'},
        {'colname':'DarkCyan', 'hex':'#00af87'},
        {'colname':'LightSeaGreen', 'hex':'#00afaf'},
        {'colname':'DeepSkyBlue2', 'hex':'#00afd7'},
        {'colname':'DeepSkyBlue1', 'hex':'#00afff'},
        {'colname':'Green3', 'hex':'#00d700'},
        {'colname':'SpringGreen3', 'hex':'#00d75f'},
        {'colname':'SpringGreen2', 'hex':'#00d787'},
        {'colname':'Cyan3', 'hex':'#00d7af'},
        {'colname':'DarkTurquoise', 'hex':'#00d7d7'},
        {'colname':'Turquoise2', 'hex':'#00d7ff'},
        {'colname':'Green1', 'hex':'#00ff00'},
        {'colname':'SpringGreen2', 'hex':'#00ff5f'},
        {'colname':'SpringGreen1', 'hex':'#00ff87'},
        {'colname':'MediumSpringGreen', 'hex':'#00ffaf'},
        {'colname':'Cyan2', 'hex':'#00ffd7'},
        {'colname':'Cyan1', 'hex':'#00ffff'},
        {'colname':'DarkRed', 'hex':'#5f0000'},
        {'colname':'DeepPink4', 'hex':'#5f005f'},
        {'colname':'Purple4', 'hex':'#5f0087'},
        {'colname':'Purple4', 'hex':'#5f00af'},
        {'colname':'Purple3', 'hex':'#5f00d7'},
        {'colname':'BlueViolet', 'hex':'#5f00ff'},
        {'colname':'Orange4', 'hex':'#5f5f00'},
        {'colname':'Grey37', 'hex':'#5f5f5f'},
        {'colname':'MediumPurple4', 'hex':'#5f5f87'},
        {'colname':'SlateBlue3', 'hex':'#5f5faf'},
        {'colname':'SlateBlue3', 'hex':'#5f5fd7'},
        {'colname':'RoyalBlue1', 'hex':'#5f5fff'},
        {'colname':'Chartreuse4', 'hex':'#5f8700'},
        {'colname':'DarkSeaGreen4', 'hex':'#5f875f'},
        {'colname':'PaleTurquoise4', 'hex':'#5f8787'},
        {'colname':'SteelBlue', 'hex':'#5f87af'},
        {'colname':'SteelBlue3', 'hex':'#5f87d7'},
        {'colname':'CornflowerBlue', 'hex':'#5f87ff'},
        {'colname':'Chartreuse3', 'hex':'#5faf00'},
        {'colname':'DarkSeaGreen4', 'hex':'#5faf5f'},
        {'colname':'CadetBlue', 'hex':'#5faf87'},
        {'colname':'CadetBlue', 'hex':'#5fafaf'},
        {'colname':'SkyBlue3', 'hex':'#5fafd7'},
        {'colname':'SteelBlue1', 'hex':'#5fafff'},
        {'colname':'Chartreuse3', 'hex':'#5fd700'},
        {'colname':'PaleGreen3', 'hex':'#5fd75f'},
        {'colname':'SeaGreen3', 'hex':'#5fd787'},
        {'colname':'Aquamarine3', 'hex':'#5fd7af'},
        {'colname':'MediumTurquoise', 'hex':'#5fd7d7'},
        {'colname':'SteelBlue1', 'hex':'#5fd7ff'},
        {'colname':'Chartreuse2', 'hex':'#5fff00'},
        {'colname':'SeaGreen2', 'hex':'#5fff5f'},
        {'colname':'SeaGreen1', 'hex':'#5fff87'},
        {'colname':'SeaGreen1', 'hex':'#5fffaf'},
        {'colname':'Aquamarine1', 'hex':'#5fffd7'},
        {'colname':'DarkSlateGray2', 'hex':'#5fffff'},
        {'colname':'DarkRed', 'hex':'#870000'},
        {'colname':'DeepPink4', 'hex':'#87005f'},
        {'colname':'DarkMagenta', 'hex':'#870087'},
        {'colname':'DarkMagenta', 'hex':'#8700af'},
        {'colname':'DarkViolet', 'hex':'#8700d7'},
        {'colname':'Purple', 'hex':'#8700ff'},
        {'colname':'Orange4', 'hex':'#875f00'},
        {'colname':'LightPink4', 'hex':'#875f5f'},
        {'colname':'Plum4', 'hex':'#875f87'},
        {'colname':'MediumPurple3', 'hex':'#875faf'},
        {'colname':'MediumPurple3', 'hex':'#875fd7'},
        {'colname':'SlateBlue1', 'hex':'#875fff'},
        {'colname':'Yellow4', 'hex':'#878700'},
        {'colname':'Wheat4', 'hex':'#87875f'},
        {'colname':'Grey53', 'hex':'#878787'},
        {'colname':'LightSlateGrey', 'hex':'#8787af'},
        {'colname':'MediumPurple', 'hex':'#8787d7'},
        {'colname':'LightSlateBlue', 'hex':'#8787ff'},
        {'colname':'Yellow4', 'hex':'#87af00'},
        {'colname':'DarkOliveGreen3', 'hex':'#87af5f'},
        {'colname':'DarkSeaGreen', 'hex':'#87af87'},
        {'colname':'LightSkyBlue3', 'hex':'#87afaf'},
        {'colname':'LightSkyBlue3', 'hex':'#87afd7'},
        {'colname':'SkyBlue2', 'hex':'#87afff'},
        {'colname':'Chartreuse2', 'hex':'#87d700'},
        {'colname':'DarkOliveGreen3', 'hex':'#87d75f'},
        {'colname':'PaleGreen3', 'hex':'#87d787'},
        {'colname':'DarkSeaGreen3', 'hex':'#87d7af'},
        {'colname':'DarkSlateGray3', 'hex':'#87d7d7'},
        {'colname':'SkyBlue1', 'hex':'#87d7ff'},
        {'colname':'Chartreuse1', 'hex':'#87ff00'},
        {'colname':'LightGreen', 'hex':'#87ff5f'},
        {'colname':'LightGreen', 'hex':'#87ff87'},
        {'colname':'PaleGreen1', 'hex':'#87ffaf'},
        {'colname':'Aquamarine1', 'hex':'#87ffd7'},
        {'colname':'DarkSlateGray1', 'hex':'#87ffff'},
        {'colname':'Red3', 'hex':'#af0000'},
        {'colname':'DeepPink4', 'hex':'#af005f'},
        {'colname':'MediumVioletRed', 'hex':'#af0087'},
        {'colname':'Magenta3', 'hex':'#af00af'},
        {'colname':'DarkViolet', 'hex':'#af00d7'},
        {'colname':'Purple', 'hex':'#af00ff'},
        {'colname':'DarkOrange3', 'hex':'#af5f00'},
        {'colname':'IndianRed', 'hex':'#af5f5f'},
        {'colname':'HotPink3', 'hex':'#af5f87'},
        {'colname':'MediumOrchid3', 'hex':'#af5faf'},
        {'colname':'MediumOrchid', 'hex':'#af5fd7'},
        {'colname':'MediumPurple2', 'hex':'#af5fff'},
        {'colname':'DarkGoldenrod', 'hex':'#af8700'},
        {'colname':'LightSalmon3', 'hex':'#af875f'},
        {'colname':'RosyBrown', 'hex':'#af8787'},
        {'colname':'Grey63', 'hex':'#af87af'},
        {'colname':'MediumPurple2', 'hex':'#af87d7'},
        {'colname':'MediumPurple1', 'hex':'#af87ff'},
        {'colname':'Gold3', 'hex':'#afaf00'},
        {'colname':'DarkKhaki', 'hex':'#afaf5f'},
        {'colname':'NavajoWhite3', 'hex':'#afaf87'},
        {'colname':'Grey69', 'hex':'#afafaf'},
        {'colname':'LightSteelBlue3', 'hex':'#afafd7'},
        {'colname':'LightSteelBlue', 'hex':'#afafff'},
        {'colname':'Yellow3', 'hex':'#afd700'},
        {'colname':'DarkOliveGreen3', 'hex':'#afd75f'},
        {'colname':'DarkSeaGreen3', 'hex':'#afd787'},
        {'colname':'DarkSeaGreen2', 'hex':'#afd7af'},
        {'colname':'LightCyan3', 'hex':'#afd7d7'},
        {'colname':'LightSkyBlue1', 'hex':'#afd7ff'},
        {'colname':'GreenYellow', 'hex':'#afff00'},
        {'colname':'DarkOliveGreen2', 'hex':'#afff5f'},
        {'colname':'PaleGreen1', 'hex':'#afff87'},
        {'colname':'DarkSeaGreen2', 'hex':'#afffaf'},
        {'colname':'DarkSeaGreen1', 'hex':'#afffd7'},
        {'colname':'PaleTurquoise1', 'hex':'#afffff'},
        {'colname':'Red3', 'hex':'#d70000'},
        {'colname':'DeepPink3', 'hex':'#d7005f'},
        {'colname':'DeepPink3', 'hex':'#d70087'},
        {'colname':'Magenta3', 'hex':'#d700af'},
        {'colname':'Magenta3', 'hex':'#d700d7'},
        {'colname':'Magenta2', 'hex':'#d700ff'},
        {'colname':'DarkOrange3', 'hex':'#d75f00'},
        {'colname':'IndianRed', 'hex':'#d75f5f'},
        {'colname':'HotPink3', 'hex':'#d75f87'},
        {'colname':'HotPink2', 'hex':'#d75faf'},
        {'colname':'Orchid', 'hex':'#d75fd7'},
        {'colname':'MediumOrchid1', 'hex':'#d75fff'},
        {'colname':'Orange3', 'hex':'#d78700'},
        {'colname':'LightSalmon3', 'hex':'#d7875f'},
        {'colname':'LightPink3', 'hex':'#d78787'},
        {'colname':'Pink3', 'hex':'#d787af'},
        {'colname':'Plum3', 'hex':'#d787d7'},
        {'colname':'Violet', 'hex':'#d787ff'},
        {'colname':'Gold3', 'hex':'#d7af00'},
        {'colname':'LightGoldenrod3', 'hex':'#d7af5f'},
        {'colname':'Tan', 'hex':'#d7af87'},
        {'colname':'MistyRose3', 'hex':'#d7afaf'},
        {'colname':'Thistle3', 'hex':'#d7afd7'},
        {'colname':'Plum2', 'hex':'#d7afff'},
        {'colname':'Yellow3', 'hex':'#d7d700'},
        {'colname':'Khaki3', 'hex':'#d7d75f'},
        {'colname':'LightGoldenrod2', 'hex':'#d7d787'},
        {'colname':'LightYellow3', 'hex':'#d7d7af'},
        {'colname':'Grey84', 'hex':'#d7d7d7'},
        {'colname':'LightSteelBlue1', 'hex':'#d7d7ff'},
        {'colname':'Yellow2', 'hex':'#d7ff00'},
        {'colname':'DarkOliveGreen1', 'hex':'#d7ff5f'},
        {'colname':'DarkOliveGreen1', 'hex':'#d7ff87'},
        {'colname':'DarkSeaGreen1', 'hex':'#d7ffaf'},
        {'colname':'Honeydew2', 'hex':'#d7ffd7'},
        {'colname':'LightCyan1', 'hex':'#d7ffff'},
        {'colname':'Red1', 'hex':'#ff0000'},
        {'colname':'DeepPink2', 'hex':'#ff005f'},
        {'colname':'DeepPink1', 'hex':'#ff0087'},
        {'colname':'DeepPink1', 'hex':'#ff00af'},
        {'colname':'Magenta2', 'hex':'#ff00d7'},
        {'colname':'Magenta1', 'hex':'#ff00ff'},
        {'colname':'OrangeRed1', 'hex':'#ff5f00'},
        {'colname':'IndianRed1', 'hex':'#ff5f5f'},
        {'colname':'IndianRed1', 'hex':'#ff5f87'},
        {'colname':'HotPink', 'hex':'#ff5faf'},
        {'colname':'HotPink', 'hex':'#ff5fd7'},
        {'colname':'MediumOrchid1', 'hex':'#ff5fff'},
        {'colname':'DarkOrange', 'hex':'#ff8700'},
        {'colname':'Salmon1', 'hex':'#ff875f'},
        {'colname':'LightCoral', 'hex':'#ff8787'},
        {'colname':'PaleVioletRed1', 'hex':'#ff87af'},
        {'colname':'Orchid2', 'hex':'#ff87d7'},
        {'colname':'Orchid1', 'hex':'#ff87ff'},
        {'colname':'Orange1', 'hex':'#ffaf00'},
        {'colname':'SandyBrown', 'hex':'#ffaf5f'},
        {'colname':'LightSalmon1', 'hex':'#ffaf87'},
        {'colname':'LightPink1', 'hex':'#ffafaf'},
        {'colname':'Pink1', 'hex':'#ffafd7'},
        {'colname':'Plum1', 'hex':'#ffafff'},
        {'colname':'Gold1', 'hex':'#ffd700'},
        {'colname':'LightGoldenrod2', 'hex':'#ffd75f'},
        {'colname':'LightGoldenrod2', 'hex':'#ffd787'},
        {'colname':'NavajoWhite1', 'hex':'#ffd7af'},
        {'colname':'MistyRose1', 'hex':'#ffd7d7'},
        {'colname':'Thistle1', 'hex':'#ffd7ff'},
        {'colname':'Yellow1', 'hex':'#ffff00'},
        {'colname':'LightGoldenrod1', 'hex':'#ffff5f'},
        {'colname':'Khaki1', 'hex':'#ffff87'},
        {'colname':'Wheat1', 'hex':'#ffffaf'},
        {'colname':'Cornsilk1', 'hex':'#ffffd7'},
        {'colname':'Grey100', 'hex':'#ffffff'},
        {'colname':'Grey3', 'hex':'#080808'},
        {'colname':'Grey7', 'hex':'#121212'},
        {'colname':'Grey11', 'hex':'#1c1c1c'},
        {'colname':'Grey15', 'hex':'#262626'},
        {'colname':'Grey19', 'hex':'#303030'},
        {'colname':'Grey23', 'hex':'#3a3a3a'},
        {'colname':'Grey27', 'hex':'#444444'},
        {'colname':'Grey30', 'hex':'#4e4e4e'},
        {'colname':'Grey35', 'hex':'#585858'},
        {'colname':'Grey39', 'hex':'#626262'},
        {'colname':'Grey42', 'hex':'#6c6c6c'},
        {'colname':'Grey46', 'hex':'#767676'},
        {'colname':'Grey50', 'hex':'#808080'},
        {'colname':'Grey54', 'hex':'#8a8a8a'},
        {'colname':'Grey58', 'hex':'#949494'},
        {'colname':'Grey62', 'hex':'#9e9e9e'},
        {'colname':'Grey66', 'hex':'#a8a8a8'},
        {'colname':'Grey70', 'hex':'#b2b2b2'},
        {'colname':'Grey74', 'hex':'#bcbcbc'},
        {'colname':'Grey78', 'hex':'#c6c6c6'},
        {'colname':'Grey82', 'hex':'#d0d0d0'},
        {'colname':'Grey85', 'hex':'#dadada'},
        {'colname':'Grey89', 'hex':'#e4e4e4'},
        {'colname':'Grey93', 'hex':'#eeeeee'}]

    def hextorgb(s):
        val = int(s.replace('#',''), 16)
        r = val & 0xFF0000
        g = val & 0x00FF00
        b = val & 0x0000FF
        return r>>16, g>>8, b

    best_error = 3*255 # 3x worst case error on each channel
    for index in range (0, len(LUT)):
        cr, cg, cb = hextorgb(color)
        lr, lg, lb = hextorgb(LUT[index]['hex'])
        error = abs(cr-lr) + abs(cg-lg) + abs(cb-lb)
        if error < best_error:
            best_error = error
            best_match = index

    return LUT[best_match], best_match

#------------------------------------------------------------------------------
# Read vim colorscheme file and write out the X11 LUT mappings
#------------------------------------------------------------------------------

with open(sys.argv[1]) as colorscheme:

    for line in colorscheme:

        highlight=''
        comment=''
        words = line.split()

        for word in words:
            if word == '"': break   # stop processing this line

            is_fg = re.match(r'guifg=.*', word) # is a foreground setting
            is_bg = re.match(r'guibg=.*', word) # is a background setting
            is_ex = re.match(r'gui=.*', word)   # is an extra setting

            if is_fg != None or is_bg != None:

                if highlight == "":
                    highlight = "highlight {}".format(words[1]) # field type
                    comment='"'

                if is_fg != None:
                    assign = is_fg.group().split('=')
                    if assign[1] == 'bg':
                      highlight += " ctermfg=bg"  # what does this do - solid?
                    elif assign[1] == 'NONE':
                      highlight += " ctermfg=NONE"
                    else:
                      col, idx = nearest256(assign[1]) # colour lookup
                      highlight += " ctermfg={}".format(idx)
                      comment += ' '+col['colname']
                else:
                    assign = is_bg.group().split('=')
                    if assign[1] == 'fg' or assign[1] == 'bg':
                      highlight += " ctermbg={}".format(assign[1])
                    elif assign[1] == 'NONE':
                      highlight += " ctermbg=NONE"
                    else:
                      col, idx = nearest256(assign[1])
                      highlight += " ctermbg={}".format(idx)
                      comment += ' '+col['colname']

            if is_ex != None:
                assign = is_ex.group().split('=')
                highlight += " cterm={}".format(assign[1])

        if highlight != "": print(highlight, comment)
