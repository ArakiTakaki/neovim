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
vim.cmd 'nmap     f [file]'

vim.api.nvim_set_keymap(
    "n",
    "[file]f",
    ":Telescope find_files<cr>",
    { noremap = true }
)

vim.cmd 'nnoremap [file]g  <cmd>Telescope live_grep<cr>'
vim.cmd 'nnoremap [file]b  <cmd>Telescope buffers<cr>'
vim.cmd 'nnoremap [file]h  <cmd>Telescope help_tags<cr>'
vim.cmd 'nnoremap [file]s  :Ack '
vim.api.nvim_set_keymap(
    "n",
    "[file]i",
    ":Telescope file_browser path=%:p:h<cr>",
    { noremap = true }
)


vim.cmd 'nnoremap <C-p> <cmd>Telescope find_files<cr>'
vim.cmd 'nnoremap <C-f> :Ack '
