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
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        -- allows passing extra args to live_grep to eg scope folders/filetypes
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- Most popular theme
  "folke/tokyonight.nvim",
  -- Github theme (matches github)
  'projekt0n/github-nvim-theme',
  -- Dracula theme (matches tmux)
  'dracula/vim',
  -- Solarized theme
  'ericbn/vim-solarized',
  -- Treesitter: parsing of syntax
  { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
  -- Switch between pieces of code
  'ThePrimeagen/harpoon',
  -- Local tree of undos and redos
  {
    'mbbill/undotree',
    keys = { { '<leader>ut', '<cmd>UndotreeToggle<CR>' } }
  },
  -- Git
  'tpope/vim-fugitive',
  -- Git blame
  'f-person/git-blame.nvim',
  -- Git gutter
  'lewis6991/gitsigns.nvim',
  -- Github Copilot
  { 'github/copilot.vim',    branch = 'release',                         event = 'InsertEnter' },
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
  -- Surround text with quotes, brackets, etc
  'tpope/vim-surround',
  -- Folding code
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  -- Faster navigation
  'ggandor/leap.nvim',
  -- Persisted yanking
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }
    },
    config = function()
      require('neoclip').setup()
    end,
  },
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
      { "saadparwaiz1/cmp_luasnip" }
    }
  },
  -- Devicons
  'nvim-tree/nvim-web-devicons',
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

  -- Preview markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
})
