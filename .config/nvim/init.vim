""""""""""""""""""""""""""""""""""""""
" Notes
""""""""""""""""""""""""""""""""""""""

" Nerd Fonts
" * Font is set and saved via iterm config
" https://github.com/ryanoasis/nerd-fonts
" Recommended: 16pt Sauce Code Pro Light Nerd Font Complete

""""""""""""""""""""""""""""""""""""""
" Always run first
""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set termguicolors

""""""""""""""""""""""""""""""""""""""
" Installation
""""""""""""""""""""""""""""""""""""""

" auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""

" Before vim-devicons
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'chr4/nginx.vim'
Plug 'chriskempson/base16-vim'
Plug 'elzr/vim-json'
Plug 'isundil/vim-irssi-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'takac/vim-spotifysearch'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/winresizer.vim'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" After nerdtree
Plug 'ryanoasis/vim-devicons'

""""""""""""""""""""""""""""""""""""""
" General config
""""""""""""""""""""""""""""""""""""""

" Set font
" set guifont=SauceCodePro_Nerd_Font_Mono:h16

" Show line numbers
set number

" Set title
set title

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Formatting shortcuts vmap <leader>s :sort<cr>

" Change mapleader
let mapleader="\\"

" Make tabs as wide as two spaces
set tabstop=2

" Use spaces for all indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Map space to / (search)
map <space> /
map <silent> <leader><cr> :nohlsearch<cr>

" Better windows navigating
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

""""""""""""""""""""""""""""""""""""""
" Plugin config
""""""""""""""""""""""""""""""""""""""

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" nerdtree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrowExpandable = '→'
" let g:NERDTreeDirArrowCollapsible = '⤵'

" base16-vim
let g:colors_name = "base16-seti"
" let g:colors_name = "base16-onedark"

" vim-prettier
" https://prettier.io/docs/en/vim.html (config options)
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.css,*.scss,*.less PrettierAsync
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#eslint_integration = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#print_width = 80
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#require_config = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#style_lint_integration = 'false'
let g:prettier#config#tab_width = 2
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#use_tabs = 'false'

" gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1


call plug#end()
