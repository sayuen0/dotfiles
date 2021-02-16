"VundleVimをつかう
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'tomtom/tcomment_vim' 
  Plugin 'fatih/vim-go'
  Plugin 'easymotion/vim-easymotion'
call vundle#end()

filetype plugin indent on 

inoremap <silent> jj <ESC>

"nerdtree関連
" control + e でツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
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


set encoding=UTF8
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

" ※矯正用: 矢印キーの使用を禁止する
"
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" vim-go関連
" エラーを消す
let g:go_version_warning = 0
" Space s やSpace vでで画面を分割して定義にジャンプ
let mapleader = "\<Space>"

au FileType go nmap <leader>s <Plug>(go-def-split)
au FileType go nmap <leader>v <Plug>(go-def-vertical)


" vim-easymotion {{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" }}}
