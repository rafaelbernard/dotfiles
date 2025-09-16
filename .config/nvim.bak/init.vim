"neovim settings
"rafael araujo <rafael dot araujo at initd dot info>

let mapleader=','


" # Configurations {{{

set expandtab 
set tabstop=4
set shiftwidth=4
set hidden
set number
set relativenumber
set autoindent
set smartindent
set autowrite
set autoread
set softtabstop=4
set shiftround
"set completeopt=menuone,longest                   "A comma separated list of options for Insert mode completion
set list
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.
"set foldlevelstart=99
set cursorline
set laststatus=2
set wildmode=longest:full,full
set scrolloff=12
set sidescrolloff=12

" # Integrations
set rtp+=~/.fzf                                   "enable fzf integration

"Enabling clipboard pastes to be available to OS
set clipboard+=unnamed

set mouse=

" }}}

" Key mapping ##### {{{

nnoremap <leader>] :tabn<CR>
nnoremap <leader>[ :tabp<CR>
nnoremap <C-p> :FZF<cr>
nnoremap <leader><Enter> :FZFMru<CR>
nnoremap <C-\> :NERDTreeToggle<CR>

map <F10> :Goyo<CR>

" Check file in shellcheck
map <leader><F6> :!clear && shellcheck %<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

"Open the current file in the default program
map <leader>x :!xdg-open %<cr><cr>

" }}}

" fzf ##########  {{{

" enables preview when exec :Files
let g:fzf_files_options = 
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" }}}


"Autoload zshrc
autocmd BufWritePost +zshrc source ~/.zshrc &

"Update binds when sxhkdrc is updated
autocmd BufWritePost +sxhkdrc !killall sxhkd; setsid sxhkd &

"To enable gruvbox scheme
"colorscheme gruvbox

" Thanks to https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
" C-_ works as Control+/
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Plugins ##### {{{

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

"call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')               "Trying to centralize for vim and nvim into the same pluggin path

" vim / theme / design
Plug 'junegunn/limelight.vim'                   "Hyperfocus-writing in Vim
source ~/.config/nvim/plugins/limelight.vim
Plug 'junegunn/goyo.vim'                        "Distraction-free writing in Vim. - better served with limelight
Plug 'junegunn/seoul256.vim'
source ~/.config/nvim/plugins/vim-airline.vim
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'                "gruvbox-community color scheme -- https://github.com/gruvbox-community/gruvbox

" integration
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'benmills/vimux'                           "so - interact with tmux from vim

" tools / helpers
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'                      "file management - Nerdtree -- Tree file navigation
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'                       "git - For git file manipulation
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/harpoon.vim

"plugins - dev
Plug 'honza/dockerfile.vim'
Plug 'StanAngeloff/php.vim'
Plug 'Townk/vim-autoclose'
Plug 'pangloss/vim-javascript' 
Plug 'mxw/vim-jsx' 
Plug 'evidens/vim-twig'

Plug 'tpope/vim-projectionist'        "|
"Plug 'roxma/nvim-completion-manager'  "|
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
call plug#end()

" }}} end plugins
