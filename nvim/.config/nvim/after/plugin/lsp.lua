local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- format on save
  lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

require('lspconfig').tsserver.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').solargraph.setup({})
require('lspconfig').lua_ls.setup({
  -- ... other configs
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "~/Library/Application Support/Code/User/snippets/" } })

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

vim.api.nvim_set_keymap('i', '<Tab>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
  { expr = true, silent = true })
