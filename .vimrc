"	Blame's personal vim settings
"			Thanks for skywind
"
"
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

set number
set cursorline
set cursorcolumn 
set tabstop=2
set backspace=2
set fileencodings=ucs-bom,utf-8,cp936
set hlsearch
set expandtab
set paste

syntax on
set showmatch
set smartindent
set shiftwidth=2
set autoindent
set ai!
set guifont=DejaVu\ Sans\ Mono\ Bold\ 14
set noshowmode
set nocompatible
filetype off

"self setting 
nmap  w=  :resize +3<CR>
nmap  w-  :resize -3<CR>
nmap  W=  :vertical resize -3<CR>
nmap  W-  :vertical resize +3<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/echodoc.vim'
"auto generate tags
Plug 'ludovicchabant/vim-gutentags'
"asyn run cmd
Plug 'skywind3000/asyncrun.vim'
"syntax check
Plug 'w0rp/ale'
"diff check
Plug 'mhinz/vim-signify'
"code highlight
Plug 'octol/vim-cpp-enhanced-highlight'
"YCM
Plug 'Valloric/YouCompleteMe'
"LeaderF search functions,tags,or filenames
Plug 'Yggdroot/LeaderF'
call plug#end()

"gutentags 
set tags=./.tags;,.tags

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" Asynrun
" the height of quickfix window
let g:asyncrun_open = 6
"wil bell when the cmd finished
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"Press F9 to compile
nnoremap <silent> <F9> :AsyncRun gcc -g  -Wall "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"Press F5 to run
nnoremap <silent> <F5> :AsyncRun -raw "-cwd=$(VIM_FILEDIR)" "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"find root dir of the current project
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml','.project'] 
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

"ALE settings
" only check when I save the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"linter
let g:ale_linters = {
\		'bash':['shellcheck'],
\		'c':['clang'],
\		'c++':['cppcheck'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\		'java':['javac'],
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\		'python':['autopep8'],
\		'ruby':['ruby']
\}

let g:ale_fixers = {
\		'bash':['shellcheck'],
\		'c':['clang'],
\		'c++':['cppcheck'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\		'java':['javac'],
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\		'python':['autopep8'],
\		'ruby':['ruby']
\}

"enhanced cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

"YCM settings
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
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

"LeaderF settings
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = ';n'
noremap <c-n> :LeaderfMru<cr>
noremap ;p :LeaderfFunction!<cr>
noremap ;n :LeaderfBuffer<cr>
noremap ;; :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
