-- provides wiki-like operation inspired by Obsidian
-- https://github.com/epwalsh/obsidian.nvim
xei = require 'xei'

local conf = xei.wiki_conf()

xei.plugin('obsidian', {
  workspaces = {
    {
      name = conf.name,
      path = conf.path,
      overrides = {
        notes_subdir = conf.daily,
        date_format = '%Y-%m-%d',
      },
    },
  },

  completion = {
    nvim_cmp = true,
  },

  new_notes_location = 'current_dir',

  preferred_link_style = 'wiki',
  disable_frontmatter = false,

  follow_url_func = function(url)
    vim.ui.open(url) -- need Neovim 0.10.0+
  end
})
