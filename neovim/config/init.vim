set nocompatible              " be iMproved, required
filetype off                  " required

" vim-plug ...
if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif


set hidden " required by CtrlSpace
set directory=/dev/shm " in-memory swap files (more risky but nothing sticks around)

filetype plugin indent on    " required

set t_Co=256 " Ignored by nvim

"colorscheme solarized
"colorscheme kalisi
"set background=light
"set background=dark

" --- ocean as theme start ----
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" -----Ocean theme-end-here----

set whichwrap+=<,>,h,l,[,] " right-arrow goes to next line
set autochdir
set autowrite " useful for :bufdo
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8

syntax on



if !has('nvim')
	set term=xterm-256color
endif

let g:deoplete#enable_at_startup = 1

if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	"let &t_AB="\e[48;5;%dm"
	"let &t_AF="\e[38;5;%dm""	
	" This is for vim-tmux-navigator in OSX
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ ExtraLight:h18
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
"set completeopt-=preview


if !has('nvim')
	" old completion stuff
	"let g:ycm_complete_in_strings = 1
	"let g:ycm_allow_changing_updatetime = 1000
	"let g:ycm_auto_trigger = 1
	"let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
	"let g:completor_auto_trigger = 1
	"let g:completor_min_chars = 2	
	inoremap _expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
	let g:completor_auto_trigger = 0
        let g:completor_gocode_binary = "$HOME/go/bin/gocode"
endif


" Go stuff
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"
            
set number
set hlsearch

nnoremap <silent> <leader>tt :TagbarToggle<CR>

"set clipboard^=unnamed
set clipboard+=unnamedplus



let g:used_javascript_libs = 'angularjs,angularui'

" expert mode
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
"
set autowrite
let g:argwrap_tail_comma = 1

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir -p ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" set listchars is useful in combination with :set list (showing whitespace chars)
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


" Syntax for js etc
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'

"autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2


" Status stuff
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set cursorline
autocmd InsertEnter * highlight StatusLine guifg=white guibg=cyan ctermfg=white ctermbg=cyan
autocmd InsertEnter * highlight LineNr guifg=white guibg=cyan ctermfg=white ctermbg=cyan
autocmd InsertLeave * highlight StatusLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
autocmd InsertLeave * highlight LineNr guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

"au InsertEnter * hi Normal ctermbg=230 guibg=#eeeeee
"au InsertLeave * hi Normal ctermbg=white guibg=#ffffff

autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

set backspace=indent,eol,start

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1


let g:CtrlSpaceDefaultMappingKey = "<C-Space> "

" Leader
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader><Space> :CtrlSpace<CR>

let mapleader=","


" vim-go
augroup vg
au FileType go nmap <Leader>, :GoAlternate<CR>
au FileType go nmap <Leader>t :GoTest
au FileType go nmap <Leader>T :GoTestFunc
"au FileType go nmap <Leader>b :GoBuild<CR>
" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <Leader>cr :GoCallers<CR>
au FileType go nmap <Leader>ce :GoCallees<CR>
au FileType go nmap <Leader>? :GoCoverageToggle<CR>
au FileType go nmap <Leader>r :GoReferrers<CR>
au FileType go nmap <Leader>d :GoDef<CR>
au FileType go nmap <Leader>D :GoDefPop<CR>
au FileType go nmap <Leader>v :GoImplements<CR>
au FileType go nmap <Leader>I :GoImports<CR>
au FileType go nmap <Leader>i :GoInstall<CR>
au FileType go nmap <Leader>p :GoPlay<CR>
au FileType go nmap <Leader>' :GoDocBrowser<CR>
au FileType go nmap <Leader>/ :GoInfo<CR>
au FileType go nmap <Leader>b :GoToggleBreakpoint<CR>
au FileType go nmap <Leader>db :GoDebug<CR>
au FileType go nmap <Leader>e :Refactor extract
augroup END



" jump to next/prev vim-go error:
" nnoremap <C-j> :cn<CR>
" nnoremap <C-k> :cp<CR>

nnoremap <Leader>. :TagbarToggle<CR>
nnoremap <Leader>d "_d

imap jk <Esc>

" Local overrides ...
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


