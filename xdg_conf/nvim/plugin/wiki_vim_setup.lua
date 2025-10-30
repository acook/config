-- wiki.vim is a plugin which adds wiki-like functionality to Vim
-- different from vimwiki
xei = require 'xei'

if not vim.g.wiki_loaded then
  return
end

vim.g.wiki_root = xei.wiki_conf().path

local function find_wiki_path_for_file(filename)
    -- recursively search for the file name in the wiki_root using ripgrep
    local rg_result_pipe = assert(io.popen(string.format(
        "rg -g '%s' --files \"%s\"",
        filename,
        vim.g.wiki_root
    )))
    local rg_result = rg_result_pipe:read("*line")
    rg_result_pipe:close()

    -- if ripgrep found a result, return that
    if rg_result then return rg_result end

    -- if it didn't find a result, the file does not exist;
    -- in that case, the link will point to the (not yet existing)
    -- corresponding file in the wiki_root
    if vim.g.wiki_root:sub(-1) == "/" then
        return vim.g.wiki_root .. filename
    else
        return vim.g.wiki_root .. "/" .. filename
    end
end

local function resolve_wiki_link(url)
    local components = {}
    for element in (url.stripped .. "#"):gmatch("([^#]*)#") do
        table.insert(components, element)
    end

    local filename = components[1]
    url.anchor = components[2] or ""

    -- infer the .md file extension
    if filename:sub(-3) ~= ".md" then filename = filename .. ".md" end

    if url.origin:sub(1, #vim.g.wiki_root) == vim.g.wiki_root then
        -- if the "origin" (the file that contains the link) is in the wiki_root,
        -- the wiki_root directory is recursively searched for the file name;
        url.path = find_wiki_path_for_file(filename)
    else
        -- if the origin is not in the wiki_root,
        -- fall back to only looking in the same directory as the origin
        url.path = url.origin:match(".*/") .. filename
    end

    return url
end

vim.g.wiki_link_schemes = {
    wiki = { resolver = resolve_wiki_link, },
}
