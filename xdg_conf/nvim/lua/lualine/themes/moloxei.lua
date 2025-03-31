local colors = {
  darkpink     = '#960050',
  red          = '#F92672',
  redorange    = '#EF5939',
  orange       = '#fd971f',
  yellow       = '#E6DB74',
  green        = '#A6E22E',
  aqua         = '#70F0F0',
  cyan         = '#66D9EF',
  navy         = '#13354A',
  blue         = '#7070F0',
  violet       = '#AE81FF',
  khaki        = '#C4BE89',
  tan          = '#A89984',
  desert       = '#75715E',
  taupe        = '#4C4745',

  black        = '#1B1D1E',
  white        = '#F8F8F2',
  gray         = '#BCBCBC',
  inactivegray = '#808080',
  darkgray     = '#232526',

  steelbright  = '#7E8E91',
  steelglint   = '#455354',
  steel        = '#293739',
}

return {
  normal = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.steelbright}
  },
  insert = {
    a = {bg = colors.white, fg = colors.navy, gui = 'bold'},
    b = {bg = colors.cyan, fg = colors.navy},
    c = {bg = colors.navy, fg = colors.cyan}
  },
  visual = {
    a = {bg = colors.orange, fg = colors.black, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.steelbright}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.steelbright}
  },
  command = {
    a = {bg = colors.white, fg = colors.steel, gui = 'bold'},
    b = {bg = colors.steelbright, fg = colors.steel},
    c = {bg = colors.steelglint, fg = colors.steelbright}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.darkgray, fg = colors.gray}
  }
}
