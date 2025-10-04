" Vim syntax file
" Langage:    fasmg
" Maintainer: Pierre-Nicolas Clauss
" Version:    0.0.1

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax region fasmgComment start="\v;" end="\v$"
highlight default link fasmgComment Comment

syntax region fasmgString start='\v"' skip='\v""' end='\v"'
highlight default link fasmgString String

syntax match fasmgOperator "\v[+/*=<>()\[\]{}:?!,.|&~#`\\-]"
syntax keyword fasmgOperator
	\ and bappend bsf bsr bswap defined definite elementof eq equ eqtype float
	\ lengthof metadata metadataof mod not or relativeto scale scaleof shl shr
	\ sizeof string trunc used xor
highlight default link fasmgOperator Operator

syntax match fasmgSymbol "\v^\s*[^[:space:]+/*=<>()\[\]{}:?!,.|&~#`\\-]*\??(\.[^[:space:]+/*=<>()\[\]{}:?!,.|&~#`\\-]*\??)*(\s*[:=])@="
syntax match fasmgSymbol
	\ "\v(^\s*(jyes|jno|jump)\s+)@<=[^[:space:]]+"
	\ contained containedin=fasmgCalmRegion
highlight default link fasmgSymbol Tag

syntax match fasmgNumber "\v(^|[[:space:]+/*=<>()\[\]{}:?!,.|&~#`\\-])@<=(\d+d?|[01]+b?|\o+[oq]?|\d\x*h?|0x\x+|\$(\x+|([$@]|\%\%?)?)|\%\%?|\d+(.\d+)?(e[+-]?\d+)?f?)($|[[:space:]+/*=<>()\[\]{}:?!,.|&~#`\\-])@="
highlight default link fasmgNumber Number

syntax keyword fasmgKeyword
	\ assert at break combinelines dbx define display element emit err esc eval
	\ file format include indx isolatelines label load local mvmacro mvstruc org
	\ purge removecomments restartout restore restruc retaincomments section
	\ store
syntax match fasmgKeyword "\v<([rd]([bwdpqt]|([dq]|dq)q))>"
highlight default link fasmgKeyword Keyword

syntax keyword fasmgFunction
	\ else end if irpv iterate macro match namespace postpone rawmatch repeat
	\ rmatch struc virtual while
highlight default link fasmgFunction Function

syntax region fasmgCalmRegion
	\ matchgroup=Function
	\ start="\v^\s*calminstruction"
	\ end="\v^\s*end calminstruction"
	\ contains=ALLBUT,fasmgKeyword
syntax keyword fasmgCalmCmd
	\ arrange assemble call check compute display emit err exit jyes jno jump
	\ load local match publish store stringify take transform
	\ contained containedin=fasmgCalmRegion
highlight default link fasmgCalmCmd Identifier

syntax match fasmgLabel "\v(^\s*namespace\s+)@<=[^[:space:]]+"
syntax match fasmgLabel "\v(^\s*iterate\s+)@<=[^[:space:]<,]+"
syntax match fasmgLabel "\v(^\s*iterate\s+\<(\s*[^[:space:],]+,\s*)*)@<=[^[:space:],>]+"
syntax match fasmgLabel
	\ "\v(^\s*calminstruction\s+)@<=[^[:space:]]+"
	\ contained containedin=fasmgCalmRegion
syntax match fasmgLabel
	\ "\v(^\s*(arrange|assemble|call|compute|local|publish|stringify|transform)\s+)@<=[^[:space:],]+"
	\ contained containedin=fasmgCalmRegion
highlight default link fasmgLabel Label

syntax match fasmgType "\v<([Tt]?[Bb][Yy][Tt][Ee]|([DdFfPpQqTtXxYyZz]?|([DdQq]|[Dd][Qq])[Qq])[Ww][Oo][Rr][Dd])>"
highlight default link fasmgType Type

syntax keyword fasmgSpecial __file__ __line__ __source__ __time__
syntax match fasmgSpecial "\v<\%t>"
highlight default link fasmgSpecial Special

let b:current_syntax = "fasmg"
