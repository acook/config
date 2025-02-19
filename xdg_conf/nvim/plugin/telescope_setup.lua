require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('heading')
require('neoclip').setup()
require('telescope').load_extension('neoclip')
require('telescope').load_extension('ctags_outline')
require('telescope').load_extension('filelinks')
require("telescope").load_extension('zoxide')

local filelinks = require('telescope').extensions['filelinks']
filelinks.setup({
    -- Wiki Links
    format_string = '[[%s|%s]]',
    url_first = false
})
-- insert mode for writing continuously
--vim.keymap.set('i', '<C-l>', filelinks.make_filelink, { desc = '[<C>]reate [l]ink in Insert Mode' })
-- normal mode
--vim.keymap.set('n', '<Leader>ml', filelinks.make_filelink, { desc = '[m]ake file [l]ink' })

-- for ctags
-- show current buf outline
--:Telescope ctags_outline
--require('telescope').extensions.ctags_outline.outline()

-- show all opened buf outline(use current buf filetype)
--:Telescope ctags_outline buf=all
--require('telescope').extensions.ctags_outline.outline({buf='all'})
