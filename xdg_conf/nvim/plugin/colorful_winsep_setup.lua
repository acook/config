local xei = require('xei')
require("colorful-winsep").setup({
  -- highlight for Window separator
  hi = {
    fg = xei.fghex('SignColumn')
  },
  -- This plugin will not be activated for filetype in the following table.
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
  -- #70: https://github.com/nvim-zh/colorful-winsep.nvim/discussions/70
  only_line_seq = false,
})
