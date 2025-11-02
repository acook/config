" skin additional elements with molokai colors
" has to be run after the theme and theme settings are already setup

hi MolokaiError guifg=#960050
hi MolokaiWarn guifg=#E6DB74
hi MolokaiInfo guifg=#465457
hi MolokaiHint guifg=#66D9EF
hi MolokaiOk guifg=#A6E22E

hi link MolokaiAddSign MolokaiOk
hi link MolokaiChangeSign MolokaiHint
hi MolokaiDeleteSign guifg=#F92672

hi DiagnosticUnderlineError guisp=#960050    gui=underline     cterm=underline
hi DiagnosticUnderlineWarn  guisp=#E6DB74 gui=underline     cterm=underline
hi DiagnosticUnderlineInfo  guisp=#465457   gui=underline     cterm=underline
hi DiagnosticUnderlineHint  guisp=#66D9EF   gui=underline     cterm=underline
hi DiagnosticUnderlineOk    guisp=#A6E22E  gui=underline     cterm=underline
hi DiagnosticDeprecated     guisp=#960050    gui=strikethrough cterm=strikethrough

" based on Comment, with italic added
hi MolokaiVTError ctermfg=59 guifg=#7e8e91 gui=italic cterm=italic
" based on NonText with italic added
hi MolokaiVTWarn ctermfg=59 guifg=#465457 gui=italic cterm=italic
hi link MolokaiVTInfo MolokaiVTWarn
hi link MolokaiVTHint MolokaiVTWarn
hi link MolokaiVTOk MolokaiVTWarn

hi! link GitGutterAdd MolokaiAddSign
hi! link GitGutterChange MolokaiChangeSign
hi! link GitGutterDelete MolokaiDeleteSign
hi! link GitGutterChangeDelete MolokaiChangeSign

hi! link SignifySignAdd MolokaiAddSign
hi! link SignifySignChange MolokaiChangeSign
hi! link SignifySignDelete MolokaiDeleteSign

hi! link GitSignsAdd MolokaiAddSign
hi! link GitSignsChange MolokaiChangeSign
hi! link GitSignsDelete MolokaiDeleteSign

hi GitSignsAddLn guifg=none
hi GitSignsChangeLn guifg=none
hi GitSignsDeleteLn guifg=none

"Builtin Diagnostics

hi! link DiagnosticError MolokaiError
hi! link DiagnosticSignError MolokaiError
hi! link DiagnosticFloatingError MolokaiVTError
hi! link DiagnosticVirtualTextError MolokaiVTError

hi! link DiagnosticWarn MolokaiWarn
hi! link DiagnosticSignWarn MolokaiWarn
hi! link DiagnosticFloatingWarn MolokaiVTWarn
hi! link DiagnosticVirtualTextWarn MolokaiVTWarn

hi! link DiagnosticInfo MolokaiInfo
hi! link DiagnosticSignInfo MolokaiInfo
hi! link DiagnosticFloatingInfo MolokaiVTInfo
hi! link DiagnosticVirtualTextInfo MolokaiVTInfo

hi! link DiagnosticHint MolokaiHint
hi! link DiagnosticVirtualTextHint MolokaiVTHint
