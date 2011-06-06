" Test suite for Vim plugin script grep utility
" Language:    vim script
" Maintainer:  Dave Silvia <dsilvia@mchsi.com>
" Date:        8/11/2004
"
" For V3.0 of Vimgrep
"
" execute in any vim session in an empty buffer
command! VGtest1 call VGtest1()

" execute in any vim session
command! VGtest2 VimgrepToBuf fun\p*match\w* &runtimepath -d -f \w*\.vim\>

" execute in any vim session
command! VGtest3 VimgrepEdit \<try\>\|catch\|fina\%[lly]\|endtry $VIMRUNTIME -M -f \w*\.vim\>

" execute in any vim session
command! VGtest4 VimgrepHelp $T\w*mp\w*

" execute in any vim session with open listed buffers
command! VGtest5 VimgrepBufs ^\s*fu\%[nction]\%[!]\s\+\p*

" execute in vim session with open listed buffers
command! VGtest6 VimgrepBufsToBuf ^\s*fu\%[nction]\%[!]\s\+\p*

" execute in vim session
command! VGtest7 Vimgrep ^\s*fu\%[nction]\%[!]\s\+\p* match*.vim,vim.vim -t -d

" execute in vim session
command! VGtest8 Vimgrep ^\s*fu\%[nction]\%[!]\s\+\p* match*.vim,vim.vim,f*.vim,g*.vim -F -d

" execute in any vim session in an empty buffer
" <args> can be any file(s)
command! -nargs=1 VGtestArgs call VGtestArgs(<args>)

" execute in vim session
command! VGtodo Vimgrep todo $VIMRUNTIME.'/indent/*.vim' -t

function! VGtest1()
	let @a=Vimgrep('fun\p*indent\w*',&runtimepath,'-d','-f','\w*\.vim\>')
	normal gg
	normal "aP
endfunction

function! VGtestArgs(args)
	let @a=Vimgrep('\s*fu\%[nction]\%[!]\s\+\p*',a:args)
	normal gg
	normal "aP
endfunction

fu! Fu()
endf

fun! Fun()
endfun

	 func! Func()
	 endfunc
