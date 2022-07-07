-- Git Commands
vim.cmd 'nnoremap [git]    <Nop>'
vim.cmd 'nmap     <Space>g [git]'
vim.cmd 'nnoremap <silent> [git]s :Git status -sb<CR>'
vim.cmd 'nnoremap <silent> [git]d :<C-u>Gdiff<CR>'
vim.cmd 'nnoremap <silent> [git]b :Git blame<CR>'
vim.cmd 'nnoremap <silent> [git]h :<C-u>GBrowse<CR>'
vim.cmd 'nnoremap <silent> [git]g :LazyGit<CR>'

-- File Commands
vim.cmd 'nnoremap [file]    <Nop>'
vim.cmd 'nmap     <Space>f [file]'
vim.cmd 'nnoremap [file]f <cmd>Telescope find_files<cr>'
vim.cmd 'nnoremap [file]g <cmd>Telescope live_grep<cr>'
vim.cmd 'nnoremap [file]b <cmd>Telescope buffers<cr>'
vim.cmd 'nnoremap [file]h <cmd>Telescope help_tags<cr>'
vim.cmd 'nnoremap [file]s :Ack '

vim.cmd 'nnoremap <C-p> <cmd>Telescope find_files<cr>'
vim.cmd 'nnoremap <C-f> :Ack '

-- local a = require "plenary.async"
-- local path = 'hoge'
-- local err, fd = a.uv.fs_open(path, "r", 438)