"vim settings
"rafael araujo <rafael dot araujo at initd dot info>


"Handling plugin installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

set number                                      "number all lines
"set relativenumber          " each line in your file is numbered relative to the cursor’s current position to show the distance to that line.
set expandtab tabstop=2                         "transform tab into 2 spaces
set autoindent
set smartindent                                 "reacts to the syntax/style of the code you are editing
"set ruler
"set autowrite
"set autoread                "When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
"set noshowmode              "If in Insert, Replace or Visual mode put a message on the last line.
"set hidden
"set nojoinspaces            "Insert two spaces after a '.', '?' and '!' with a join command.
"set shiftwidth=2            "Returns the effective value of 'shiftwidth'. This is the 'shiftwidth' value unless it is zero, in which case it is the 'tabstop' value.
"set softtabstop=2
"set shiftround                  "Round indent to multiple of 'shiftwidth'.  Applies to > and < commands (...)
"set pumheight=15                                  "Determines the maximum number of items to show in the popup menu
"set completeopt=menuone,longest                   "A comma separated list of options for Insert mode completion
"set list
"set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.
"set foldmethod=indent
"set foldlevelstart=99
"set incsearch
"set cursorline                                    "underline at cursor line
"set synmaxcol=2048
"set laststatus=2
set rtp+=~/.fzf                                   "enable fzf integration
