augroup filetypedetect
au BufNewFile,BufRead *.wiki setf Mediawiki
au BufRead,BufNewFile *.wiki.cashnetusa.com* setfiletype Mediawiki
au BufRead,BufNewFile *.wikipedia.org.* setfiletype Mediawiki
augroup END
