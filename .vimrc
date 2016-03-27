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
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'
Plug 'shime/vim-livedown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gorodinskiy/vim-coloresque'

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
call plug#end()

" .vimrc.after is loaded after the plugins have loaded
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
