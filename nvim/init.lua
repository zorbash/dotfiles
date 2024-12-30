---@diagnostic disable: undefined-global

vim.opt.number = true
vim.opt.ruler = true
vim.opt.clipboard = 'unnamed'
vim.opt.mouse = 'a'
vim.opt.relativenumber = false

vim.cmd [[
  syntax enable
]]

vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.backspace = {'indent', 'eol', 'start'}

vim.g.netrw_banner = 0

-- List chars
vim.opt.listchars = {
  tab = '▸-',
  trail = '.',
  extends = '>',
  precedes = '<'
}

vim.opt.hlsearch = true    -- Highlight matches
vim.opt.incsearch = true   -- Search in incremental
vim.opt.ignorecase = true  -- Case insensitive
vim.opt.smartcase = true   -- Case sensitive when capital letter exists

vim.opt.wildignore= {
  '*.o','*.out','*.obj','.git','*.rbc','*.rbo','*.class','.svn','*.gem',
  -- Disable archive files
  '*.zip','*.tar.gz','*.tar.bz2','*.rar','*.tar.xz',
  '*/vendor/gems/*','*/vendor/cache/*','*/.bundle/*','*/.sass-cache/*',
  -- Disable swap
  '*.swp','*~,._*'
}

vim.opt.backupdir = vim.opt.backupdir ^ '~/.vim/_backup//'
vim.opt.directory = vim.opt.directory ^ '~/.vim/_temp//'

-- backup to ~/.tmp
vim.opt.backup = true
vim.opt.backupskip = {'/tmp/*', '/private/tmp/*'}
vim.opt.writebackup = true
vim.opt.swapfile = false
vim.opt.autoread = true

-- Set <Leader>
vim.g.mapleader = '\\'

-- Easier Splits
vim.keymap.set('n', '<Leader>ew', ':e <C-R>=expand("%:h")."/"<CR>')
vim.keymap.set('n', '<Leader>es', ':sp <C-R>=expand("%:h")."/"<CR>')
vim.keymap.set('n', '<Leader>ev', ':vsp <C-R>=expand("%:h")."/"<CR>')
vim.keymap.set('n', '<Leader>et', ':tabe <C-R>=expand("%:h")."/"<CR>')

-- Quick tab-switching
vim.cmd [[
  map <silent> <PageUp> :tabprevious <CR>
  map <silent> <PageDown> :tabnext <CR>
  map <silent> ª :tabprevious <CR>
  map <silent> º :tabnext <CR>
  tnoremap <silent> <PageUp> :tabprevious <CR>
  tnoremap <silent> <PageDown> :tabnext <CR>
  tnoremap <silent> ª <C-\>t :tabprevious <CR>
  tnoremap <silent> º <C-\>t :tabnext <CR>

  map <silent> <A-9> :tabprevious <CR>
  map <silent> <A-0> :tabnext <CR>
  tnoremap <silent> <A-9> <C-\>t :tabprevious <CR>
  tnoremap <silent> <A-0> <C-\>t :tabnext <CR>
]]

-- Toggle hlsearch with <leader>hs
vim.keymap.set('n', '<Leader>hs', ':set hlsearch! hlsearch?<CR>')

-- Moving Lines
vim.keymap.set('n', '<C-j>', ':m .+1<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>')
vim.keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<C-j>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<C-m>', ':m \'<-2<CR>gv=gv')

-- Copy to clipboard
vim.cmd [[
  vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!pbcopy<CR>u
]]

vim.cmd [[
  filetype plugin indent on
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
]]

-- Plugins
require('packages')


-- After Plugins

vim.cmd [[colorscheme NeoSolarized]]

vim.opt.colorcolumn = {'90', '120'}

-- Change the colour of the max width line
vim.cmd [[highlight ColorColumn ctermbg=11]]

-- Perf
vim.opt.lazyredraw = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Markdown and Spelling in Git commit messages
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.md',
  command = 'setlocal spell'
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost'}, {
  pattern = '*.md',
  command = 'set filetype=markdown'
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'gitcommit',
  command = 'setlocal spell'
})

-- Trimming Whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.{rb,html.erb,coffee,clj,ls,sql,yml,js,html,css,scss,ex,exs}',
  command = ':FixWhitespace'
})

-- See https://github.com/nvim-lualine/lualine.nvim for all available options
require('lualine').setup {
  options = {theme = 'solarized_dark'}
}

-- Moving between buffers
vim.keymap.set('t', '<A-h', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<A-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<A-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<A-l>', [[<C-\><C-n><C-w>l]])
vim.keymap.set('t', '<Leader>t', [[<C-\><C-n>]])

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Useful on MacOS with a Mac keyboard (option instead of alt) and not using Ghostty
vim.keymap.set('t', '˙', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '∆', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '˚', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '¬', [[<C-\><C-n><C-w>l]])

vim.keymap.set('n', '˙', [[<C-\><C-n><C-w>h]])
vim.keymap.set('n', '∆', [[<C-\><C-n><C-w>j]])
vim.keymap.set('n', '˚', [[<C-\><C-n><C-w>k]])
vim.keymap.set('n', '¬', [[<C-\><C-n><C-w>l]])

-- FZF
-- This is the default extra key bindings
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- FZF Keymaps
vim.keymap.set('n', '<C-p>', ':Files!<CR>')
vim.keymap.set('n', '<C-f>', ':Rg!<CR>')

-- Default fzf layout
-- - down / up / left / right
-- In Neovim, you can set up fzf window using a Vim command
vim.g.fzf_layout = { window = 'enew' }
vim.g.fzf_layout = { window = '-tabnew' }
vim.g.fzf_layout = { window = '10new', up = '%60' }

-- Customize fzf colors to match your color scheme
vim.g.fzf_colors = {
  ['fg'] =      {'fg', 'Normal'},
  ['bg'] =      {'bg', 'Normal'},
  ['hl'] =      {'fg', 'Comment'},
  ['fg+'] =     {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] =     {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] =     {'fg', 'Statement'},
  ['info'] =    {'fg', 'PreProc'},
  ['border'] =  {'fg', 'Ignore'},
  ['prompt'] =  {'fg', 'Conditional'},
  ['pointer'] = {'fg', 'Exception'},
  ['marker'] =  {'fg', 'Keyword'},
  ['spinner'] = {'fg', 'Label'},
  ['header'] =  {'fg', 'Comment'}
}

-- Enable per-command history.
-- CTRL-N and CTRL-P will be automatically bound to next-history and
-- previous-history instead of down and up. If you don't like the change,
-- explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
vim.g.fzf_history_dir = '~/.local/share/fzf-history'

vim.g.fzf_files_options = '--preview "(coderay {} || less {}) 2> /dev/null | head -\'.&lines.\'"'

-- Markdown Preview
vim.g.mkdp_auto_close = 0

vim.cmd [[
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always -g "!_build" --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)
]]


-- Floating Terminal
vim.g.floaterm_title = 'term: $1/$2'
vim.g.floaterm_width = 0.8
vim.g.floaterm_position = 'bottomright'
vim.g.floaterm_gitcommit = 'split'
vim.g.floaterm_open_command = 'vsplit'
vim.g.floaterm_keymap_new    = '<leader>fa'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<leader>ft'

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- LSP
require('lsp')
