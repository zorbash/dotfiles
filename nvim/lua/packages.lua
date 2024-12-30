---@diagnostic disable: undefined-global

local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-projectionist'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug('junegunn/fzf', {
    ['do'] = function()
      vim.cmd [[
        fzf#install()
      ]]
    end
  })
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/committia.vim'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'altercation/vim-colors-solarized'
  Plug('Tsuzat/NeoSolarized.nvim', { branch = 'master' })
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'mhinz/vim-startify'
  Plug 'kshenoy/vim-signature'
  Plug 'dense-analysis/ale'
  Plug 'bogado/file-line'
  Plug 'voldikss/vim-floaterm'
  Plug 'camspiers/lens.vim'
  Plug 'junegunn/goyo.vim'
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  Plug 'nvim-treesitter/playground'
  Plug 'pechorin/any-jump.vim'

  Plug 'Shougo/unite.vim'
  Plug 'Quramy/vison'

  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'

  Plug 'nvim-lua/plenary.nvim'

 -- Languages

  Plug 'pmizio/typescript-tools.nvim'
  Plug 'github/copilot.vim'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug('iamcco/markdown-preview.nvim', {
    ['do'] = function()
      vim.call('mkdp#util#install()')
    end,
    ['for'] = {'markdown', 'vim-plug'}
  })
  Plug 'vim-ruby/vim-ruby'
  Plug 'pangloss/vim-javascript'
  Plug 'elixir-lang/vim-elixir'
  Plug 'jimenezrick/vimerl'
  Plug 'janko/vim-test'
  Plug 'chrisbra/csv.vim'
vim.call('plug#end')
