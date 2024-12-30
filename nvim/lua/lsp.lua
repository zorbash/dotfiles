---@diagnostic disable: undefined-global

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'elixirls' }
})

-- Copilot
vim.g.copilot_enabled = 0 -- Disable by default
vim.keymap.set('n', '<Leader>cd', ':Copilot disable<CR>')
vim.keymap.set('n', '<Leader>ce', ':Copilot enable<CR>')

vim.g.ale_linters = {
 ruby = {'rubocop'},
 elixir = {}
}

vim.g.ale_float_preview = 1

vim.g.ale_fixers = {
  ['*'] = {},
  elixir = { 'mix_format' }
}
vim.g.ale_fix_on_save = 1

vim.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect', 'noinsert'}

 ---- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
       vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.lua_ls.setup({ capabilities = capabilities })
require'lspconfig'.elixirls.setup({
  capabilities = capabilities,
  cmd = {'/Users/zorbash/dev/elixir-ls/rel/language_server.sh'},
  dialyzerEnabled = false
})

require('typescript-tools').setup({ capabilities = capabilities })
