" myfiletypefile

augroup filetypedetect
  autocmd! BufRead,BufNewFile *.*emacs,*.vm,*.el,*.bbdb   setfiletype lisp
  autocmd! BufRead,BufNewFile *.hsp                       setfiletype spice
  autocmd! BufRead,BufNewFile *README*,*.txt,*.cfg        setfiletype text
  autocmd! BufRead,BufNewFile *DB,*.ad                    setfiletype xdefaults
  autocmd! BufRead,BufNewFile *.pt,.synopsys*,*.dc        setfiletype synopsys
  autocmd! BufRead,BufNewFile INBOX,jsolomon,mbox         setfiletype mail
  autocmd! BufRead,BufNewFile *.net                       setfiletype lsi
  autocmd! BufRead,BufNewFile *.cshrc                     setfiletype csh
  autocmd! BufRead,BufNewFile *.qc,*.qh,*.c\,v,*.h\,v     setfiletype c
  autocmd! BufRead,BufNewFile *.tclsh*                    setfiletype tcl
  autocmd! BufRead,BufNewFile fvwm2rc,Fvwm*,*.fvwm2       setfiletype fvwm | let b:fvwm_version = 2
  autocmd! BufRead,BufNewFile *.cls                       setfiletype tex
  autocmd! BufRead,BufNewFile *.dat                       setfiletype license
  autocmd! BufRead,BufNewFile cds.lib                     setfiletype cdslib
augroup END
