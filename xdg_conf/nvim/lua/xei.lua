local M = {}

function M.has(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function M.hasstr(table, pattern)
  for _, value in pairs(table) do
    if string.find(value, pattern) then
      return true
    end
  end
  return false
end

function M.any(table, func)
  for _, value in pairs(table) do
    if func(value) then
      return true
    end
  end
  return false
end

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

function M.echo(msg)
  vim.api.nvim_echo({{msg}}, true, {})
end

function M.warn(msg)
  vim.api.nvim_echo({{msg, 'WarningMsg'}}, true, {})
end

function M.err(msg)
  vim.api.nvim_echo({{msg}}, true, {err=true})
end

function M.xdghome()
  local xdg_home = os.getenv('XDG_CONFIG_HOME')

  if xdg_home and string.len(xdg_home) > 0 then
    return xdg_home .. '/'
  else
    local home = os.getenv('HOME')

    if home:len() > 0 then
      return home .. '/.config/'
    else
      return '.config/'
    end
  end
end

function M.optional(module_name)
  local success, module = pcall(require, module_name)
  if success then
    return module
  end
  return nil
end

function M.use(module_name)
  local module = M.optional(module_name)

  if not module then
    M.warn("module "..module_name.." not found")
    return
  end

  return module
end

function M.plugin(plugin_name, config, silent)
  local plugin = {}
  if silent then
    plugin = M.optional(plugin_name)
  else
    plugin = M.use(plugin_name)
  end
  if plugin then
    if config then
      plugin.setup(config)
    else
      plugin.setup()
    end
  end
  return plugin
end

local inspector = M.optional('inspect')
if inspector then
  M.inspect = inspector.inspect
else
  M.inspect = nil
end

function M.pp(value)
  if M.inspect then
    M.echo(M.inspect(value))
  else
    M.echo(value)
  end
end

function M.filename(buf)
  buf = buf or 0
  local name = ''
  local path = vim.api.nvim_buf_get_name(buf)
  local basename = vim.fn.fnamemodify(path, ':t')

  if path ~= '' then
    name = basename
  end

  return name
end

function M.titlestring(buf)
  buf = buf or 0
  local title = M.filename(buf)
  local modified = vim.bo[buf].modified

  if modified then
    title = title .. ' ●'
  end

  return title
end

return M
