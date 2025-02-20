local xei = require 'xei'

-- set the color of the window pane separator
local dim, _ = xei.hlhl({ {'SignColumn', 'bg'}, {'CursorLine','bg'}, {'Conceal', 'fg'} })
local winsep = { fg = dim }
vim.api.nvim_set_hl(0, 'WinSeparator', winsep)

