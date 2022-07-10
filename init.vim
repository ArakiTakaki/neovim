
"=====================================================================
" variables
let is_nvim = has('nvim')
let is_windows = has("win32") || has("win64")
let mapleader = "," " <leader>で使用できる

"=====================================================================
" lua の読み込み
if has('nvim')
  lua require('entry')
endif
"=====================================================================
" other config
" syntax on " ハイライトプラグインがあるのでオフ
filetype plugin indent on  " ファイルタイプの検出とは、ファイルを開いたときにファイルの種類を検出する機能  https://vim-jp.org/vimdoc-ja/filetype.html

"=====================================================================
" set
"
" if is_windows
"   set encoding=sjis
" else
" endif
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
" autocmd
" autocmd BufNewFile,BufRead *.tsx                set filetype=typescript.tsx
" autocmd BufNewFile,BufRead *.jsx                set filetype=javascrip.jsx
autocmd BufNewFile,BufRead *.vert,*.vart,*.frag set filetype=glsl
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=javascript.tsx
" autocmd BufWritePre * :%s/\t/  /ge  " 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\s\+$//ge  " 末尾スペースを削除


"=====================================================================
" mapの違い
" ref http://naporeon.blogspot.com/2014/12/nmapnnoremap.html

"=====================================================================
" nmap ノーマルモード用のキーマッピング
" ノーマルモードとは https://knowledge.sakura.ad.jp/22069/#i

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
"
if is_nvim
  autocmd BufNewFile,BufRead *.vue set filetype=vue
  " autocmd FileType vue syntax sync fromstart
  " let g:ale_fixers = {
  " \   'typescript': ['prettier'],
  " \   'typescriptreact': ['prettier'],
  " \   'javascript': ['prettier'],
  " \   'javascriptreact': ['prettier'],
  " \   'vue': ['prettier'],
  " \   'css': ['prettier'],
  " \}

  let g:ale_sign_error = 'P>'
  let g:ale_sign_warning = 'P-'
  let g:ale_echo_msg_format = '[%linter%] %code: %%s'
  let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
  let g:ale_pattern_options = {
  \   '.*\.json$': {'ale_enabled': 0},
  \}
  nmap <silent> <C-w>j <Plug>(ale_next_wrap)
  nmap <silent> <C-w>k <Plug>(ale_previous_wrap)
  let g:ale_fix_on_save = 1
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'

  nnoremap <silent>sf :<C-u>Defx -listed -resume
        \ -buffer-name=tab`tabpagenr()`
        \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

  nnoremap <silent>fi :<C-u>Defx -listed -resume
        \ -buffer-name=tab`tabpagenr()`
        \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
  nnoremap <F3> :<C-u>Defx<CR>
  " call defx#custom#option('_', {
  "   \ 'toggle': 1,
  "   \ 'resume': 1,
  "   \ 'show_ignored_files': 1,
  "   \ 'columns': 'git:icons:indent:filename:mark',
  "   \ })
  call defx#custom#option('_', {
        \ 'winwidth': 40,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'show_ignored_files': 1,
        \ 'buffer_name': 'exlorer',
        \ 'toggle': 1,
        \ 'resume': 1,
        \ })

  " autocmd FileType netrw
  autocmd FileType defx call s:defx_my_settings()
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

  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
endif

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
colorscheme nvcode " Or whatever colorscheme you make
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
