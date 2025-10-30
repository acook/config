-- https://github.com/norcalli/nvim-colorizer.lua
local xei = require 'xei'
local colorizer = xei.optional('colorizer')

if not colorizer then
  return
end

if vim.api.nvim_get_option('termguicolors') then
  colorizer.setup()
else
  xei.echo("colorizer: skipping, requires &termguicolors to be true")
end
