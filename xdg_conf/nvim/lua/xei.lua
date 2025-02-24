
local function num_to_hex(num)
  return ("%06x"):format(num)
end

-- NeoVim returns colors as integers rather than hex colors
-- some plugins expect hex
local function hexify(num)
  return ("#%06x"):format(num)
end

-- get colorscheme color table
-- {fg=123, bg=456, gui='bold'}
local function hl(name)
  return vim.api.nvim_get_hl(0, {name=name,create=false})
end

-- get colorscheme fg as hex
local function fghex(name)
  local fg = vim.api.nvim_get_hl(0, {name=name,create=false}).fg
  if fg then
    return hexify(fg)
  else
    return 'NONE'
  end
end

-- get colorscheme bg as hex
local function bghex(name)
  local bg = vim.api.nvim_get_hl(0, {name=name,create=false}).bg
  if bg then
    return hexify(bg)
  else
    return 'NONE'
  end
end

-- try to see if a value has nothing in it
local function isempty(value)
  return not value or value == '' or value == 'NONE' or value == vim.empty_dict()
end

local function isnotempty(value)
  return not isempty(value)
end

-- get a colorscheme color, with multiple fallback options
-- pass in a second parameter to confirm the presence of a field
-- or instead of a list of names, tables like {'name', 'field'}
-- ex: hlhl({ {'Normal', 'bg'} })
local function hlhl(names, part)
  if type(names) == 'string' then
    return hl(names)
  end

  local h, empty
  for i,name in ipairs(names) do
    local p = part
    if type(name) == 'table' then
      p = name[2]
      name = name[1]
    end
    h = hl(name)
    empty = isempty(h)
    if not empty and not p then
      return h, name
    elseif not empty and (p and h[p]) then
      return h[p], name
    end
  end
  return 'NONE', 'NONE'
end

local function len(table)
  local i = 0
  for _ in pairs(table) do i = i + 1 end
  return i
end

local circ_nums = {'󰲡', '󰲣', '󰲥', '󰲧', '󰲩', '󰲫', '󰲭', '󰲯', '󰲱', '󰲳'}
local function circ(num)
  return circ_nums[num] or circ_nums[10]
end

local fcirc_nums = {'󰲠', '󰲢', '󰲤', '󰲦', '󰲨', '󰲪', '󰲬', '󰲮', '󰲰', '󰲲'}
local function fcirc(num)
  return fcirc_nums[num] or fcirc_nums[10]
end



local inspect = require('inspect').inspect

local function pp(value)
  print(inspect(value))
end

return {
  num_to_hex = num_to_hex,
  hexify = hexify,
  hl = hl,
  hlhl = hlhl,
  fghex = fghex,
  bghex = bghex,
  len = len,
  circ = circ,
  fcirc = fcirc,
  pp = pp,
}
