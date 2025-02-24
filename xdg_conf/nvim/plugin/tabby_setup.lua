-- nanozuki/tabby.nvim
local xei = require 'xei'
local api = require('tabby.module.api')
local win_name = require('tabby.feature.win_name')

function get_lualine_colors()
  local status, lualine = pcall(require, "lualine")
  local colors

  if status then
    local theme_name = lualine.get_config().options.theme
    local theme = require("lualine.themes." .. theme_name)

    -- FIXME: this is the exact color that will be made into Normal.bg
    -- So find another way to get this color
    colors = theme
  else
    local main = xei.hl('Normal')
    local colors = { normal={ a={fg=main.bg, bg=main.fg} } }
    colors.b = colors.a
    colors.c = colors.a
  end

  return colors
end

local function tab_name(tab)
  local tabid = tab.id
	local wins = api.get_tab_wins(tabid)
	local cur_win = api.get_tab_current_win(tabid)
	local name = ''
	local modified = false
  local indicator = ""

	if api.is_float_win(cur_win) then
    local ft = vim.fn.getbufvar(api.get_win_buf(cur_win), '&filetype')
    if ft == 'TelescopePrompt' then
      name = ' Telescope 󱝂'
    else
      name = 'Floating'
    end
	else
		name = win_name.get(cur_win)
	end

  tab.wins().foreach(function(win)
    if win.buf().is_changed() then
      modified = true
    end
  end)

	if #wins > 1 then
    if modified then
      indicator = xei.fcirc(#wins)
    else
      indicator = xei.circ(#wins)
    end
		name = (name .. ' ' .. indicator)
	end
	return name
end

local lualine = get_lualine_colors()

xei.sethl('TabLineSel', {fg=lualine.normal.b.fg, bg=lualine.normal.c.bg, bold=true})
xei.sethl('TabLine',    {fg=lualine.normal.c.bg, bg=lualine.normal.c.fg, bold=false})

local theme = {
	fill = {fg=lualine.normal.c.fg, bg=lualine.normal.b.bg},
	head = 'TabLine',
	current_tab = 'TabLineSel',
	tab = 'TabLine',
	win = 'TabLine',
	tail = 'TabLine',
}

require('tabby').setup({
	line = function(line)
		return {
			{
				-- TODO: use the icon of the current file, if available
				{ '  ', hl = theme.head },
				line.sep('', theme.head, theme.fill),
			},
			hl = theme.fill,
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				return {
					line.sep('', hl, theme.fill),
					tab_name(tab),
					tab.close_btn('×'),
					line.sep('', hl, theme.fill),
					hl = hl,
					margin = ' ',
				}
			end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        return {
          line.sep('', theme.win, theme.fill),
          win.buf_name(),
          line.sep('', theme.win, theme.fill),
          hl = theme.win,
          margin = ' ',
        }
      end),
      {
        line.sep('', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
		}
	end,
})
