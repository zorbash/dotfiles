if !has('nvim')
  set encoding=utf-8
end

" .vimrc.before is loaded before the plugins have loaded
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'yuki-ycino/fzf-preview.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'
"Plug 'shime/vim-livedown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gorodinskiy/vim-coloresque'
Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'
Plug 'bogado/file-line'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'janko/vim-test'
Plug 'chrisbra/csv.vim'

call plug#end()

" .vimrc.after is loaded after the plugins have loaded
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
