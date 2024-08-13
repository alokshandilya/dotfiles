vim.cmd [[
    augroup MyFileTypeSettings
        autocmd!
        autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    augroup END
]]

