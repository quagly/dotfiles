" vundle vim plugin manager settings must come first
" vundle installed with command
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" file browser
Bundle 'scrooloose/nerdtree'
" use python-mode for python code
Bundle 'klen/python-mode'

"auto-completion for python
Bundle 'davidhalter/jedi-vim'

"docker file support
Plugin 'ekalinin/Dockerfile.vim'

" All of your Plugins must be added before the following line
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

syntax enable
set background=dark
set autoindent
set smartindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set ruler
set hlsearch
set paste
color desertEx
" set vim current working directory to script directory
set autochdir
" use nerdtree to file browse with F2
map <F2> :NERDTreeToggle<CR>

" BEGIN python-mode settings
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" using jedi-vim for autocompletion so disable rope
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" END python-mode

" BEGIN jedi-vim
" just a collection of setting I found
" don't really understand them

" autocompletes as you type
" may be slow for large modules
let g:jedi#popup_select_first = 1
"let g:jedi#goto_command = "<leader>g"  
"let g:jedi#get_definition_command = "<leader>d"  
"let g:jedi#rename_command = "<leader>r"  
"let g:jedi#related_names_command = "<leader>n"  
"let g:jedi#autocompletion_command = "<C-Space>"

" use custom antlr3 syntax for grammer files
au BufRead,BufNewFile *.g set syntax=antlr3

" use angle bracket syntax for stringtemplate group files
" note there is another $ delimited syntax file I am not using now
" au BufRead,BufNewFile *.stg set syntax=stringtemplatedollar
au BufRead,BufNewFile *.stg set syntax=stringtemplate


" use ant sytax instead of xml for ant build files
" anything with build in the name with extention xml 
au BufRead,BufNewFile *build*.xml set filetype=ant

" llvm text assembler syntax highlighting 
au BufRead,BufNewFile *.ll set filetype=llvm

" pig latin syntax highlighting 
au BufRead,BufNewFile *.pig set filetype=pig

" asciidoc syntax highlighting 
au BufRead,BufNewFile *.adoc set filetype=asciidoc

" use groovy syntax highlighting for gradle build scripts
au BufNewFile,BufRead *.gradle setf groovy

" json syntax highlighting
au! BufRead,BufNewFile *.json set filetype=json 

" open files at last position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
  \ endif

augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END
