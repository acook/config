-- https://github.com/nvim-lualine/lualine.nvim
local xei = require 'xei'

local lualine = xei.plugin('lualine',
{
  options = {
    theme = 'moloxei',
    icons_enabled = true,
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'filename',
        newfile_status = true,
        path = 1,
        symbols = {
          modified = '●',
          readonly = '',
          newfile  = '󱙄',
          unnamed  = ''
        }
      }
    },
    lualine_c = {'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        symbols = {
          modified = '●',
          readonly = '',
          newfile  = '󱙄',
          unnamed  = ''
        }
      }
    }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

