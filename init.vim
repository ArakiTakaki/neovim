filetype plugin indent on

"=====================================================================
" variables
let is_nvim = has('nvim')
" let is_windows = has("win32") || has("win64")
let mapleader = "," " <leader>で使用できる
"=====================================================================
if is_nvim
  lua require('entry')
endif
"=====================================================================
set encoding=utf-8
set number
" set ruler                " ルーラーの表示
set cursorline             " 行を強調表示
set cursorcolumn           " 列を強調表示
set clipboard+=unnamedplus " クリップボードのコピー
set encoding=utf-8         " 文字コード
set linespace=0            " hoge
set nowrap                 " 文字の折り返し設定
" set showcmd                " コマンドをステータス行に表
set ignorecase             " 大文字小文字無視
set smartcase              " 大文字ではじめたら大文字小文字無視しない
set wrapscan               " 最後まで検索したら先頭へ戻る
set hlsearch               " 検索文字をハイライト
set incsearch              " インクリメンタルサーチ
" set list
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " インデントなどの設定

"=====================================================================
" imap インサートモード用のキーマッピング
imap <C-H> <BS>
"=====================================================================
" noremap ノーマルモード用のキーマッピング
" 行頭、行末
noremap <Space>h  ^
noremap <Space>l  $
" 分割ウィンドウ移動
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 平行分割ウィンド
noremap ss :split<Return><C-w>w
" 水平分割ウィンド
noremap sv :vsplit<Return><C-w>w
noremap gh gT
noremap gl gt
noremap gn :tabnew<CR>
" <Space>q で強制終了
noremap <Space>q :<C-u>q!<Return>
" <Space>w 強制保存
noremap <Space>w :<C-u>w<Return>
" ESC*2 でハイライトやめる
noremap <Esc><Esc> :<C-u>set nohlsearch<Return>
"=====================================================================
" vnoremap
vnoremap < <gv
vnoremap > >gv
" 0番レジスタを使いやすくした
" via http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p
"=====================================================================
" command
command! Memo edit ~/memo.markdown
command! Read edit ~/.config/nvim/README.md

"=====================================================================
" あとで変更する
"=====================================================================
" defx
"=====================================================================
nnoremap <silent>sf :<C-u>Defx -listed -resume
    \ -buffer-name=tab`tabpagenr()`
    \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

nnoremap <silent>fi :<C-u>Defx -listed -resume
    \ -buffer-name=tab`tabpagenr()`
    \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <F3> :<C-u>Defx<CR>
autocmd FileType defx call s:defx_my_settings()
call defx#custom#option('_', {
    \ 'winwidth': 40,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 1,
    \ 'buffer_name': 'exlorer',
    \ 'toggle': 1,
    \ 'resume': 1,
    \ })
function! s:defx_my_settings() abort
  " Define mappings
  autocmd BufWritePost * call defx#redraw()
  autocmd BufEnter * call defx#redraw()
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> o defx#do_action('open','tabnew')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> l defx#do_action('drop')
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> t defx#do_action('open','tabnew')
endfunction
" Defx自動起動設定
autocmd BufEnter,VimEnter,BufNew,BufWinEnter,BufRead,BufCreate
    \ * if isdirectory(expand('<amatch>'))
    \   | call s:browse_check(expand('<amatch>')) | endif
function! s:browse_check(path) abort
  if bufnr('%') != expand('<abuf>')
    return
  endif

  " Disable netrw.
  augroup FileExplorer
    autocmd!
  augroup END

  execute 'Defx' a:path
endfunction
