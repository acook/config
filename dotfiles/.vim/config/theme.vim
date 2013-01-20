if has('gui_running')

  " for Gui versions of vim. see :help guioptions for more info
  set guifont=Monaco:h12
  set guioptions=aAce
  colorscheme monokai_modified

  " for MacVim
  if has("macunix")
    set transparency=8
  end

elseif version >= 700 && &term != 'cygwin'

  " configure 256 color schemes for terminal using CSApprox or guicolorscheme
  set t_Co=256
  if has('gui')
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
    colorscheme monokai_modified
  else
    runtime! bundle/plugin-guicolorscheme/plugin/guicolorscheme.vim
    GuiColorScheme monokai_modified
  endif

endif

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
