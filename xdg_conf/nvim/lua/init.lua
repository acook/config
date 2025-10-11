-- for NeoVim configuration which is better done using Lua
local xei = require 'xei'

-- configure NeoVim's builtin diagnostics
vim.diagnostic.config{
    -- only show virtual text for the current line
    virtual_text = { current_line = true },
    underline = true,
    -- change indicator signs to nicer nerd font ones
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
}

-- set the color of the window pane separator
local dim, _ = xei.hlhl({ {'SignColumn', 'bg'}, {'CursorLine','bg'}, {'Conceal', 'fg'} })
local winsep = { fg = dim }
vim.api.nvim_set_hl(0, 'WinSeparator', winsep)

