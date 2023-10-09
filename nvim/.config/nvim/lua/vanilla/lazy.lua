local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Fuzzy find files
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- VSCode theme
  'Mofiqul/vscode.nvim',
  -- Treesitter: parsing of syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- Switch between pieces of code
  'ThePrimeagen/harpoon',
  -- Local tree of undos and redos
  {
    'mbbill/undotree',
    keys = { { '<leader>ut', '<cmd>UndotreeToggle<CR>' } }
  },
  -- Git
  'tpope/vim-fugitive',
  -- Github Copilot
  { 'github/copilot.vim',              branch = 'release', event = 'InsertEnter' },
  -- For funsies
  {
    'eandrju/cellular-automaton.nvim',
    keys = {
      { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>' },
      { '<leader>fmL', '<cmd>CellularAutomaton game_of_life<CR>' }
    }
  },
  -- Comment out lines with gcc (insert mode, supports count) and gc (visual mode)
  'tpope/vim-commentary',
  -- LSP for solargraph etc
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  -- Notification popups
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- Tmux navigation (requires same in tmux)
  'christoomey/vim-tmux-navigator',
})
