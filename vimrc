set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'haya14busa/incsearch.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
 "Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'itchyny/lightline.vim'
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'scrooloose/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'Chiel92/vim-autoformat'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'davidhalter/jedi-vim'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set rtp+=~/.fzf
let g:solarized_termcolors=16
syntax on " 自动语法高亮
set background=dark
colorscheme solarized
set number " 显示行号

set ruler " 打开状态栏标尺

set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4

set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格

set tabstop=4 " 设定 tab 长度为 4

set ts=4
set expandtab
set nobackup " 覆盖文件时不备份

set autochdir " 自动切换当前目录为当前文件所在的目录

"filetype plugin indent on " 开启插件

set backupcopy=yes " 设置备份时的行为为覆盖

set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

set nowrapscan " 禁止在搜索到文件两端时重新搜索

set incsearch " 输入搜索内容时就显示搜索结果

set hlsearch " 搜索时高亮显示被找到的文本

set noerrorbells " 关闭错误信息响铃

set novisualbell " 关闭使用可视响铃代替呼叫

set t_vb= " 置空错误铃声的终端代码


set magic " 设置魔术

set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set guioptions-=T " 隐藏工具栏

set guioptions-=m " 隐藏菜单栏

set smartindent " 开启新行时使用智能自动缩进

set backspace=indent,eol,start

" 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1 " 设定命令行的行数为 1

set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 设置在状态行显示的信息

set foldenable " 开始折叠
set foldmethod=indent
set foldlevel=99
" set foldmethod=syntax " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置折叠层数为

" set foldclose=all " 设置为自动关闭折叠

" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 配置多语言环境

if has("multi_byte")

    " UTF-8 编码

    set encoding=utf-8

    set termencoding=utf-8
endif

set formatoptions+=mM

set fencs=utf-8,gbk

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
" 选中状态下 Ctrl+c 复制
let g:ackprg = 'ag --vimgrep'
vmap <C-c> "+y
let mapleader = ","
set ignorecase
set incsearch
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <c-space> ?
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" imap <C-> <C-x>

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
nmap <leader>. <Plug>(easymotion-repeat)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"F5检查代码
"auto-format
""F2自动格式化代码并保存
noremap <F2> :Autoformat<CR>
let g:autoformat_verbosemode=1
noremap <C-p> :FZF<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>ts :tab split<cr>

" Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"
"lightline config
"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ }
" 命令模式快捷键
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" using ag to serach codes
let g:ackprg = 'ag --vimgrep'
" pythom-mode config
"python-mode
let g:pymode_warnings = 0
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python2
let g:pymode_python = 'python'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 0
"不使用python-mode运行python代码
let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
"不使用python-mode设置断点
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 0
"编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 1
"侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 0
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
let g:pymode_rope = 0
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 0
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion_bind = '<C-l>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" tagbar用到的ctags位置
let g:tagbar_ctags_bin='$HOME/bin/ctags'

map <F5> :TagbarToggle<CR>


noremap <F8> :PymodeLint<CR>

