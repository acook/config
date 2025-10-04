local M = {}

function M.num_to_hex(num)
  return ("%06x"):format(num)
end

-- NeoVim returns colors as integers rather than hex colors
-- some plugins expect hex
function M.hexify(num)
  return ("#%06x"):format(num)
end

-- get colorscheme color table
-- {fg=123, bg=456, gui='bold'}
function M.hl(name)
  return vim.api.nvim_get_hl(0, {name=name,create=false})
end

function M.sethl(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

-- get colorscheme fg as hex
function M.fghex(name)
  local fg = vim.api.nvim_get_hl(0, {name=name,create=false}).fg
  if fg then
    return M.hexify(fg)
  else
    return 'NONE'
  end
end

-- get colorscheme bg as hex
function M.bghex(name)
  local bg = vim.api.nvim_get_hl(0, {name=name,create=false}).bg
  if bg then
    return M.hexify(bg)
  else
    return 'NONE'
  end
end

-- try to see if a value has nothing in it
function M.isempty(value)
  return not value or value == '' or value == 'NONE' or value == vim.empty_dict()
end

function M.isnotempty(value)
  return not M.isempty(value)
end

-- get a colorscheme color, with multiple fallback options
-- pass in a second parameter to confirm the presence of a field
-- or instead of a list of names, tables like {'name', 'field'}
-- ex: hlhl({ {'Normal', 'bg'} })
function M.hlhl(names, part)
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
    h = M.hl(name)
    empty = M.isempty(h)
    if not empty and not p then
      return h, name
    elseif not empty and (p and h[p]) then
      return h[p], name
    end
  end
  return 'NONE', 'NONE'
end

function M.len(table)
  local i = 0
  for _ in pairs(table) do i = i + 1 end
  return i
end

local circ_nums = {'󰲡', '󰲣', '󰲥', '󰲧', '󰲩', '󰲫', '󰲭', '󰲯', '󰲱', '󰲳'}
function M.circ(num)
  return circ_nums[num] or circ_nums[10]
end

local fcirc_nums = {'󰲠', '󰲢', '󰲤', '󰲦', '󰲨', '󰲪', '󰲬', '󰲮', '󰲰', '󰲲'}
function M.fcirc(num)
  return fcirc_nums[num] or fcirc_nums[10]
end


--require without raising an error if the file is missing
local function prequire(m)
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

local inspector = prequire('inspect')
if inspector then
  inspect = inspector.inspect
else
  inspect = nil
end

function M.pp(value)
  if inspect then
    print(inspect(value))
  else
    print(value)
  end
end

return M
