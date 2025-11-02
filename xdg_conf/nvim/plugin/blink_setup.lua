-- completion plugin using several different sources
-- https://github.com/Saghen/blink.cmp

local xei = require 'xei'
xei.plugin('blink', {
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = false } },
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}, 'silent')
