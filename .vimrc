filetype plugin indent on 

inoremap <silent> jj <ESC>

syntax on

" スワップファイルの作成先を変更
set noswapfile


" ヤンクをクリップボードへ繋ぐ
set clipboard=unnamed

" ビープ音を消す
set belloff=all

" 行番号系
set number

" タイトル系
set title

" インデント系
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
au FileType go setlocal sw=4 ts=4 sts=4 noet
set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 挿入モードでバックスペース削除を有効
set backspace=indent,eol,start


" 検索した時にハイライト
set hlsearch

" キーバインド------------------------------------------------------------------

"xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


"クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" insertモードでemacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>


set nowrap

set hlsearch 
set ignorecase
set smartcase

set autoindent

set ruler
set list
set wildmenu
set showcmd

set shiftwidth=2
set tabstop=2

