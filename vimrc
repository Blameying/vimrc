colorscheme molokai

set number
set cursorline
set cursorcolumn 
set tabstop=4
set backspace=2
set fileencodings=ucs-bom,utf-8,cp936

let mapleader = "-"

syntax on
set showmatch
set smartindent
set shiftwidth=4
set autoindent
set ai!
set guifont=DejaVu\ Sans\ Mono\ Bold\ 12
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
autocmd FileType jsp set omnifunc=htmlcomplete#CompleteTags 
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

set nocompatible
filetype off


call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-run-interactive'
Plug 'gmarik/vundle'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/pathogen.vim'
"Plug 'vim-scripts/rails.vim'
Plug 'vim-scripts/Emmet.vim'
Plug 'vim-scripts/SuperTab'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/snipMate'
Plug 'altercation/solarized'
"Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/LeaderF',{'do': '.\install.sh' }
Plug 'w0rp/ale'
Plug 'vim-scripts/OmniCppComplete'
Plug 'scrooloose/nerdtree'

Plug 'Valloric/YouCompleteMe'
Plug 'tamlok/detorte'
Plug 'suan/vim-instant-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/echodoc.vim'
call plug#end()


let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open=1

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
nmap <F2> :NERDTreeToggle<CR>
let g:airline_theme='papercolor'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

filetype plugin indent on

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

let g:detorte_theme_mode = 'dark'
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,ruby,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }


"**********************************************************
"vim-run-interactive config 
nnoremap <leader>r :RunInInteractiveShell<space>
nnoremap <leader>w <C-w>
let g:ycm_collect_identifiers_from_tag_files = 1 


"**********************************************************
"gutentags 
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
set tags=./.tags;,.tags

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','debug']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"*********************************************************
"asyncrun 
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"********************************************************
"ale 
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"******************************************************* 
"Echodoc
set noshowmode

"******************************************************
"LeaderF 

let g:Lf_DefaultExternalTool = "rg"

nnoremap <leader>f :LeaderfFile<Enter>
nnoremap <leader>u :LeaderfFunctionCword<Enter>
nnoremap <leader>t :LeaderfTagCword<Enter>
nnoremap <leader>l :LeaderfLineCword<Enter>


