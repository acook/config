-- adds brackets as you type, there are a lot of plugins that do this, but this is one of the few that doesn't insert them in the middle of the word
-- unfortunately, had to disable it because it was causing errors with pipe characters in shell scripts and backtic characters in vimwiki markdown files
-- https://github.com/ZhiyuanLck/smart-pairs

local xei = require 'xei'
local pairs = xei.optional('pairs')

if not pairs then
  return
end

pairs:setup()
