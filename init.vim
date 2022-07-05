" lua の読み込み
lua require('entry')

"=====================================================================
" variables
let is_windows = has("win32") || has("win64")
let mapleader = "," " <leader>で使用できる

"=====================================================================
" other config
syntax enable
filetype plugin indent on  " ファイルタイプの検出とは、ファイルを開いたときにファイルの種類を検出する機能  https://vim-jp.org/vimdoc-ja/filetype.html

"=====================================================================
" set
"
if is_windows
  set encoding=sjis
else
  set encoding=utf-8
endif
" set ruler                  " ルーラーの表示
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
autocmd FileType markdown        setlocal sw=4 sts=4 ts=4 et
autocmd FileType apache          setlocal sw=4 sts=4 ts=4 et
autocmd FileType aspvbs          setlocal sw=4 sts=4 ts=4 et
autocmd FileType c               setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp             setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs              setlocal sw=4 sts=4 ts=4 et
autocmd FileType css             setlocal sw=2 sts=2 ts=2 et
autocmd FileType json            setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss            setlocal sw=2 sts=2 ts=2 et
autocmd FileType sass            setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff            setlocal sw=4 sts=4 ts=4 et
autocmd FileType go              setlocal sw=2 sts=2 ts=2 et
autocmd FileType eruby           setlocal sw=4 sts=4 ts=4 et
autocmd FileType html            setlocal sw=2 sts=2 ts=2 et
autocmd FileType java            setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript      setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript.jsx  setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascriptreact setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript.tsx  setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et
autocmd FileType vue             setlocal sw=2 sts=2 ts=2 et
autocmd FileType perl            setlocal sw=4 sts=4 ts=4 et
autocmd FileType php             setlocal sw=2 sts=2 ts=2 et
autocmd FileType python          setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby            setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml            setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh              setlocal sw=4 sts=4 ts=4 et
autocmd FileType sql             setlocal sw=4 sts=4 ts=4 et
autocmd FileType vb              setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim             setlocal sw=2 sts=2 ts=2 et
autocmd FileType wsh             setlocal sw=4 sts=4 ts=4 et
autocmd FileType xhtml           setlocal sw=4 sts=4 ts=4 et
autocmd FileType xml             setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml            setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh             setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala           setlocal sw=2 sts=2 ts=2 et
autocmd FileType snippet         setlocal sw=4 sts=4 ts=4 et
autocmd FileType glsl            setlocal sw=4 sts=4 ts=4 et
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

