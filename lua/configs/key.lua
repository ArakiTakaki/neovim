local util = require 'utils'
local is = require 'is'
-- Git Commands
-- vim.api.nvim_set_keymap('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })
-- :nnoremap <silent> <Leader><Space> :set hlsearch<CR>
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

local indent = util.setIndent;
indent('markdown',        4, true)
indent('apache',          4, true)
indent('aspvbs',          4, true)
indent('c',               4, true)
indent('cpp',             4, true)
indent('cs',              4, true)
indent('css',             2, true)
indent('json',            2, true)
indent('scss',            2, true)
indent('sass',            2, true)
indent('diff',            4, true)
indent('go',              2, true)
indent('eruby',           4, true)
indent('html',            2, true)
indent('java',            4, true)
indent('vue',             2, true)
indent('perl',            4, true)
indent('php',             2, true)
indent('python',          4, true)
indent('ruby',            2, true)
indent('haml',            2, true)
indent('sh',              4, true)
indent('sql',             4, true)
indent('vb',              4, true)
indent('vim',             2, true)
indent('wsh',             4, true)
indent('xhtml',           4, true)
indent('xml',             4, true)
indent('yaml',            2, true)
indent('zsh',             4, true)
indent('scala',           2, true)
indent('snippet',         4, true)
indent('glsl',            4, true)
indent('javascript',      2, true)
indent('javascript.jsx ', 2, true)
indent('javascriptreact', 2, true)
indent('typescript',      2, true)
indent('typescript.tsx',  2, true)
indent('typescriptreact', 2, true)


if is.windows then
    vim.g.python3_host_prog = 'C:\\develop\\python'
end