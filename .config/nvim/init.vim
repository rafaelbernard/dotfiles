"neovim settings
"rafael araujo <rafael dot araujo at initd dot info>

let mapleader=','

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

"call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')               "Trying to centralize for vim and nvim into the same pluggin path

" vim / theme / design
Plug 'junegunn/limelight.vim'                   "Hyperfocus-writing in Vim
Plug 'junegunn/goyo.vim'                        "Distraction-free writing in Vim. - better served with limelight
Plug 'junegunn/seoul256.vim'
"Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
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
"It requires nvim 0.5 -- not working so far
"Plug 'nvim-lua/popup.nvim'                      "Popup for telescope
"Plug 'nvim-lua/plenary.nvim'                    "Plenary for telescope
"Plug 'nvim-telescope/telescope.nvim'            "Telescope file explorer

"plugins - dev
Plug 'honza/dockerfile.vim'
Plug 'StanAngeloff/php.vim'
Plug 'Townk/vim-autoclose'
Plug 'pangloss/vim-javascript' 
Plug 'mxw/vim-jsx' 
Plug 'evidens/vim-twig'

"Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
"Plug 'roxma/nvim-completion-manager'  "|
Plug 'noahfrederick/vim-composer'     "|
Plug 'noahfrederick/vim-laravel'
call plug#end()

" # Configurations {{{

set number                                      "number all lines
set relativenumber                              " each line in your file is numbered relative to the cursor’s current position to show the distance to that line.
set expandtab tabstop=4                         "transform tab into 2 spaces
set autoindent
set smartindent                                 "reacts to the syntax/style of the code you are editing
"set ruler
set autowrite                                   "Write the contents of the file, if it has been modified, on each :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!, 	:make, CTRL-] and CTRL-^ command;
set autoread                                    "When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
"set noshowmode                                 "If in Insert, Replace or Visual mode put a message on the last line.
"set hidden
"set nojoinspaces            "Insert two spaces after a '.', '?' and '!' with a join command.
set shiftwidth=4            "Returns the effective value of 'shiftwidth'. This is the 'shiftwidth' value unless it is zero, in which case it is the 'tabstop' value.
set softtabstop=4
set shiftround                                  "Round indent to multiple of 'shiftwidth'.  Applies to > and < commands (...)
"set pumheight=15                                  "Determines the maximum number of items to show in the popup menu
"set completeopt=menuone,longest                   "A comma separated list of options for Insert mode completion
"set list
"set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.
"set foldmethod=indent
"set foldlevelstart=99
"set incsearch
set cursorline                                    "underline at cursor line
"set synmaxcol=2048
set laststatus=2                                   "The value of this option influences when the last window will have a status line. 2 = always
set wildmode=longest,list,full                     "Enables autocomplete

" # Integrations
set rtp+=~/.fzf                                   "enable fzf integration

"Enabling clipboard pastes to be available to OS
set clipboard+=unnamed

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

" }}}

" fzf ##########  {{{

" enables preview when exec :Files
let g:fzf_files_options = 
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" }}}


" airline ########## {{{

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" }}}

"Autoload zshrc
        autocmd BufWritePost +zshrc source ~/.zshrc &


"Update binds when sxhkdrc is updated
        autocmd BufWritePost +sxhkdrc !killall sxhkd; setsid sxhkd &

"To enable gruvbox scheme
"colorscheme gruvbox
