" vimrc from scratch for vim 9
" Mike West at the beach 2022-11-12

set nocompatible
filetype off
" detect filetypes
" filetype setting requried for pymode
filetype indent plugin on

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
set autochdir

color desert256v2

" START python-mode
"
" options https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt
" completely enable/disable pymode  1/0
let g:pymode = 1

" I used to prefer jedi-vim for completion
" but it isn't working right now
" may look at new completion plugins
" enable rope for now
let g:pymode_rope = 1

" turn on/off completion
let g:pymode_rope_completion = 1
" try control-x unless you remap it
" for example control-x n for auto completion
" use control c
" let g:pymode_rope_refix = '<C-c>'
" do not autocomplete for modules that are not imported
let g:pymode_rope_autoimport = 0
" turn on auto completion when typing a period
let g:pymode_rope_complete_on_dot = 1

"  GOTO definition
let g:pymode_rope_goto_definition_bind = '<C-c>g'

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
" using ALE for linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Support virtualenv
let g:pymode_virtualenv = 1

" use smart python motions
let g:pymode_motion = 1

" Don't autofold code
let g:pymode_folding = 0

" Extend line-length
let g:pymode_options_max_line_length = 132
" show color column at max line length
let g:pymode_options_colorcolumn = 1

" END python-mode

" START ALE
" inline python format checker and fixer
" to see how ALE is configured for any buffer
" :ALEInfo

" Configure fixers by filetype
" * is global
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8'],
\   'rust': ['rustfmt'],
\}

" Only run linters named in ale_linters settings.
" one because pylama does not know about exception groups in 3.11.0 yet 
" 2022-11-14
let g:ale_linters_explicit = 1

" linters I installed
let g:ale_linters={
\ 'python': ['flake8'],
\ 'rust': ['analyzer'],
\}

" Airline status integration
let g:airline#extensions#ale#enabled = 1

" ALE can help with completions
" leave off for now, try later
let g:ale_completion_enabled = 0

" END ALE

" START jedi-vim

" turn on/off jedi-vim
let g:jedi#auto_initialization = 0

" autocompletes as you type
" may be slow for large modules
let g:jedi#popup_select_first = 1
"let g:jedi#goto_command = "<leader>g"
"let g:jedi#get_definition_command = "<leader>d"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#related_names_command = "<leader>n"
"let g:jedi#autocompletion_command = "<C-Space>"

" END jedi-vim


" START vim-json

" turn off vim 7.3 conceal feature for vim-json plugin
" otherwise we cannot tell the difference between number, booleans, and
" strings
" see https://github.com/elzr/vim-json/issues/37
let g:vim_json_syntax_conceal = 0

" END vim-json

" edn syntax highlighting
" edn is a data format description that clojure/datatomic uses
" https://github.com/edn-format/edn
autocmd BufRead,BufNewFile *.edn setf clojure

" use ant sytax instead of xml for ant build files
" anything with build in the name with extention xml
autocmd BufRead,BufNewFile *build*.xml setf ant

" asciidoc syntax highlighting
autocmd BufRead,BufNewFile *.adoc setf asciidoc

" use groovy syntax highlighting for gradle build scripts
autocmd BufNewFile,BufRead *.gradle setf groovy

" llvm text assembler syntax highlighting
autocmd BufRead,BufNewFile *.ll setf llvm

" md extention always means markdown
autocmd BufNewFile,BufReadPost *.md setf markdown

" open file where we left off
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" remove trailing whitespace on write for everyfile
" note this is a bad idea if trailing whitespace is important for somefile
" can't think of an example
" note that the ALE plugin does this now
" leaving this here until I commit to using ALE
" autocmd BufWritePre * %s/\s\+$//e
