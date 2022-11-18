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
" set number
" set ruler                " ルーラーの表示
set cursorline             " 行を強調表示
" set cursorcolumn           " 列を強調表示
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
noremap <Space>i :lua vim.lsp.buf.code_action()<cr>
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
command! Import :lua vim.lsp.buf.code_action()<cr>

