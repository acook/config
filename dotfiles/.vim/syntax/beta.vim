" Vim syntax file
" Language:     BETA
" Maintainer:   Janus N. Tøndering <janus@bananus.dk>
" Last Change:  2002 Oct 12

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
setlocal iskeyword+=>
setlocal iskeyword+=+

" BETA is case-insensitive

" Reserved words (uppercase... though they are allowed to
" be lowercase by the compiler. This will be fixed later)
syn keyword betaProperty ORIGIN INCLUDE BODY MDBODY OBJFILE
syn keyword betaProperty LIBFILE LINKOPT BETARUN BUILD MAKE
syn keyword betaProperty RESOURCE LIBDEF LIBITEM ON OFF OTHER

" BETA is case-insensitive
syntax case ignore
syn keyword betaImp leave inner suspend code
syn keyword betaKeyword enter do exit
syn keyword betaRepeat for repeat restart 
syn keyword betaConditional if then else
syn keyword betaConstant true false
syn keyword betaOperator -> + -

" String, comment and fragment
syn region betaString display start=/'/ skip=/\\'/ end=/'/
syn region betaComment display start=/(\*/ end=/\*)/
syn region betaFragment display start=/-\{2,}/ end=/-\{2,}/
syn region betaSlot display start=/<<SLOT/ end=/>>/

" Numbers (from Bram Moolenaar's c.vim)
syn match	betaNumber display "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	betaNumber display "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	betaFloat display "\d\+f"
"floating point number, with dot, optional exponent
syn match	betaFloat display "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	betaFloat display "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	betaFloat display "\d\+e[-+]\=\d\+[fl]\=\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_beta_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
	
	HiLink betaProperty         PreProc
	HiLink betaFragment         PreProc
	HiLink betaString           String
	HiLink betaComment          Comment
	HiLink betaImp              Statement
	HiLink betaConditional      Conditional
	HiLink betaRepeat           Repeat
	HiLink betaKeyword          Keyword
	HiLink betaConstant         Boolean 
	HiLink betaNumber           Number
	HiLink betaFloat            Float
	HiLink betaSlot             betaFragment
	HiLink betaOperator         Operator

	delcommand HiLink
endif

let b:current_syntax = "beta"
