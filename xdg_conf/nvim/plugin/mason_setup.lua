-- Mason is a package manager used for LSP servers and similar
-- https://github.com/mason-org/mason.nvim

local xei = require 'xei'
local status, mason = pcall(require, 'mason')

if not status then
  xei.warn("plugin not found: mason")
  return
end

mason.setup()
