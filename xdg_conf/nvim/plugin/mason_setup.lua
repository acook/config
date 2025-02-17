
require("mason").setup()

local lspconfig = require('lspconfig')

function xdghome()
  local xdg_home = os.getenv('XDG_CONFIG_HOME')

  if xdg_home:len() > 0 then
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

lspconfig.vls.setup {
    cmd = { xdghome() .. 'v-analyzer/bin/v-analyzer' },
}

