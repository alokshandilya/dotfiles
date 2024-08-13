vim.cmd [[
    augroup MyFileTypeSettings
        autocmd!
        autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    augroup END
]]

