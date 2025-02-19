-- make the separation line between windows the same as the gutter color

local gutter = vim.api.nvim_get_hl_by_name('SignColumn', true)
local winsep = vim.api.nvim_get_hl_by_name('WinSeparator', true)

winsep.foreground = gutter.background
vim.api.nvim_set_hl(0, 'WinSeparator', winsep)

