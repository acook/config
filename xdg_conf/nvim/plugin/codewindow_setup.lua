-- displays a "minimap" overview of the file
-- https://github.com/gorbit99/codewindow.nvim

local xei = require 'xei'
local codewindow = xei.plugin('codewindow', {
  window_border = ''
}, 'silent')

if not codewindow then
  return
end

codewindow.apply_default_keybinds()
