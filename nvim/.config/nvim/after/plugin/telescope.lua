local telescope = require('telescope')
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup {
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    vimgrep_arguments = vimgrep_arguments
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
      layout_config = {
        height = 0.70
      }
    },
    buffers = {
      show_all_buffers = true
    },
    live_grep = {
    },
    git_status = {
      git_icons = {
        added = " ",
        changed = " ",
        copied = " ",
        deleted = " ",
        renamed = "➡",
        unmerged = " ",
        untracked = " ",
      },
      previewer = false,
      theme = "dropdown"
    }
  }
}

telescope.load_extension('fzf')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {}) -- grep current word/selection
vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>pr', builtin.command_history, {})
vim.keymap.set('n', '<leader>ps', builtin.search_history, {})
vim.keymap.set('n', '<leader>pc', telescope.extensions.neoclip.default, {})
