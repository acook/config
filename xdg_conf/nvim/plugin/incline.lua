local helpers = require 'incline.helpers'
local devicons = require 'nvim-web-devicons'

local I = {}

local status, _ = pcall(require, "lualine")
if status then
  local lc = require("lualine").get_config()
  if lc.options then
    --theme = require("lualine.themes." .. lc.options.theme)
    theme = require("lualine.themes.powerline")

    I.nfg = theme.normal.a.fg
    I.nbg = theme.normal.a.bg
    I.ifg = theme.insert.a.fg
    I.ibg = theme.insert.a.bg
    I.rfg = theme.replace.a.fg
    I.rbg = theme.replace.a.bg
    I.vfg = theme.visual.a.fg
    I.vbg = theme.visual.a.bg
  end
end

if not I.nbg then
  -- fallback colors would go here
  --I.nbg = '#FF0000'
  --I.nbg = '#00FF00'
end

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

--print(dump(theme['replace']))

require('incline').setup {
  ignore = {
    filetypes = { 'neo-tree' }
  },
  window = {
    padding = 0,
    margin = { horizontal = 0 },
    overlap = { borders = true, tabline = true, winbar = true, statusline = true },
    margin = { vertical = 0, horizontal = 0 },
    placement = { vertical = 'top' },
    winhighlight = { Normal = 'InclineNormalNC' },
  },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)
    local modified = vim.bo[props.buf].modified

    m = vim.api.nvim_get_mode().mode
    if m:match("n") then
      I.fg = I.nfg
      I.bg = I.nbg
    elseif m:match("i") then
      I.fg = I.ifg
      I.bg = I.ibg
    elseif m:match("R") then
      I.fg = I.rfg
      I.bg = I.rbg
    elseif m:match("v") or m:match("V") or m:match("") then
      I.fg = I.vfg
      I.bg = I.vbg
    else
      I.fg = "#000000"
      I.bg = "#FFFFFF"
    end
    --print('MODE:' .. m .. '(' .. I.bg .. ')')

    return {
      ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
      ' ',
      { filename, gui = modified and 'bold,italic' or 'bold' },
      ' ',
      guifg = I.fg,
      guibg = I.bg,
    }
  end,
}
