-- packer config が動作し次第移植
vim.cmd[[
"=====================================================================
" ack
"=====================================================================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
]]