require('utils.entry')

-- Git Commands
Util.cmd 'nnoremap [git]    <Nop>'
Util.cmd 'nmap     <Space>g [git]'
Util.cmd 'nnoremap <silent> [git]s :Git status -sb<CR>'
Util.cmd 'nnoremap <silent> [git]d :<C-u>Gdiff<CR>'
Util.cmd 'nnoremap <silent> [git]b :Git blame<CR>'
Util.cmd 'nnoremap <silent> [git]h :<C-u>GBrowse<CR>'
Util.cmd 'nnoremap <silent> [git]g :LazyGit<CR>'

-- File Commands
Util.cmd 'nnoremap [file]    <Nop>'
Util.cmd 'nmap     <Space>f [file]'
Util.cmd 'nnoremap [file]f <cmd>Telescope find_files<cr>'
Util.cmd 'nnoremap [file]g <cmd>Telescope live_grep<cr>'
Util.cmd 'nnoremap [file]b <cmd>Telescope buffers<cr>'
Util.cmd 'nnoremap [file]h <cmd>Telescope help_tags<cr>'
