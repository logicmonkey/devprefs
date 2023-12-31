" VisBlockIncr: assumes that a block of numbers selected by a ctrl-v
"               (visual block) has been selected for incrementing.
"               This function will transform that block of numbers
"               into an incrementing column starting from that topmost number
"               in the visual block.
"
"  Usage:       Use ctrl-v to visually select a column of numbers.  Then :I<CR>
"               will use the first line's number as a starting point.
"
"  Fancy Stuff:
"               * If the visual block is ragged right (as can happen when "$"
"                 is used to select the right hand side), the block will have
"                 spaces appended to straighten it out
"               * If the strlen of the count exceeds the visual-block
"                 allotment of spaces, then additional spaces will be inserted
"
"  Author:      Charles E. Campbell, Jr.  Ph.D.
"  Date:        October 18, 2001
fu! VisBlockIncr()
  " save boundary line numbers
  let y1= line("'<")
  let y2= line("'>")

  " construct a line from the first line that
  " only has the number in it
  norm! `>
  let rght  = col(".")
  norm! `<
  let lft   = col(".")
  let rml   = rght - lft
  let rmlp1 = rml  + 1
  let lm1   = lft  - 1
  if lm1 <= 0
    let lm1= 1
    let pat   = '^\([0-9 \t]\{1,'.rmlp1.'}\).*$'
  else
    let pat   = '^.\{'.lm1.'}\([0-9 \t]\{1,'.rmlp1.'}\).*$'
  endif
  let cnt   = substitute(getline("'<"),pat,'\1',"")
  let cnt   = substitute(cnt,'\s','',"ge")

  " go through visual block incrementing numbers based
  " on first number (saved in cnt), taking care to
  " avoid issuing "0h" commands.
  norm! `<
  let l = y1
  while l <= y2
    let cntlen= strlen(cnt)

	" Straighten out ragged-right visual-block selection
	" by appending spaces as needed and convert visual
	" block zone to all spaces
	norm! $
	while col("$") <= rght
	 exe "norm! A \<Esc>"
	endwhile
	let bkup=col(".")
	if bkup > lft
	 let bkup= bkup - lft
	 exe "norm! ".bkup."h"
	endif
    exe "norm! " . rmlp1 . "r "

	" cnt has gotten bigger than the visually-selected
	" area allows.  Will insert spaces to accommodate it.
	let ins=strlen(cnt) - rmlp1
    while ins > 0
     exe "norm! i \<Esc>"
     let ins= ins - 1
    endwhile

	" back up to left-of-block
	let bkup=col(".")
	if bkup > lft
	 let bkup= bkup - lft
	 exe "norm! ".bkup."h"
	endif

	" replace with count
	exe "norm! R" . cnt . "\<Esc>"
	if rmlp1 >= 2
	 exe "norm! " . rml . "h"
	endif

	" set up for next line
	norm! j
    let cnt   = cnt + 1
    let l     = l  + 1
  endw
endf
" ------------------------------------------------------------------------------
com! -ra I call VisBlockIncr()
