" ---- language-env DON'T MODIFY THIS LINE!
set nocompatible    " Vim 디폴트 기능들을 사용함
set backspace=2     " 삽입 모드에서 백스페이스를 계속 허용
set autoindent      " 자동 들여쓰기
set cindent         " C 언어 자동 들여쓰기
set smartindent     " 역시 자동 들여쓰기
set nowrapscan      " 찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음
set nobackup       " 백업파일을 만들지 않음
set novisualbell    " 비주얼벨 기능을 사용하지 않음
set nojoinspaces    " J 명령어로 줄을 붙일 때 마침표 뒤에 한칸만 띔
set ruler           " 상태표시줄에 커서 위치를 보여줌
set showcmd         " (부분적인) 명령어를 상태라인에 보여줌
set showmatch       " 매치되는 괄호의 반대쪽을 보여줌
set ignorecase      " 찾기에서 대/소문자를 구별하지 않음
set incsearch       " 점진적으로 찾기
set autowrite       " :next 나 :make 같은 명령를 입력하면 자동으로 저장
set title			" 타이틀바에 현재 편집중인 파일을 표시
"set colorcolumn=120

set expandtab  " Enabled in filetype python plugin
set softtabstop=4
set tabstop=4       " <Tab> 간격
set shiftwidth=4    " 자동 들여쓰기 간격
set modeline
"set nu              " 라인 넘버
set fileencoding=utf-8
if has("syntax")
  syntax on
endif

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xuyuanp/nerdtree-git-plugin'
call vundle#end()

map ,n :NERDTree<CR>
map ,gitd :VCSVimDiff<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" For python
filetype plugin indent on

" 버퍼 목록 켜기
" help airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 1
"let g:airline#extensions#branch#format = 2
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_theme = 'powerlineish'

au BufNewFile,BufRead *.yaml,*.yml,*.sls so ~/.vim/yaml.vim

" Force using the Django template syntax file
let g:sls_use_jinja_syntax = 1
