vim.g.mapleader = " "

-- e opens explore mode (filetree)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex);

-- In visual mode with this you can move around selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J pastes text below next to current line, this helps in keeping cursor at same position
vim.keymap.set("n", "J", "mzJ`z")

-- Vertical movement keeps cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pastes in text without overwriting the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Deletes in text without overwriting the register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Yanks to system clipboard (selection and line)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Prevent using Q
vim.keymap.set("n", "Q", "<nop>")

-- Search through tmux sessions
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Pane creation, movement and deletion
vim.keymap.set("n", "<leader>sl", "<cmd>vsplit<CR><C-w>l")
vim.keymap.set("n", "<leader>sj", "<cmd>split<CR><C-w>j")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>dh", "<C-w>h<c<md>close<CR>")
vim.keymap.set("n", "<leader>dj", "<C-w>j<cmd>close<CR>")
vim.keymap.set("n", "<leader>dk", "<C-w>k<cmd>close<CR>")
vim.keymap.set("n", "<leader>dl", "<C-w>l<cmd>close<CR>")

-- Save shortcut
vim.keymap.set("n", "<leader>u", vim.cmd.update)

-- Close shortcut
vim.keymap.set("n", "<leader>q", function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  local readonly = vim.api.nvim_buf_get_option(0, 'readonly')

  if buftype == 'terminal' or readonly then
    print("Closing terminal");
    vim.api.nvim_command("q")
  else
    print("Saving and closing");
    vim.api.nvim_command("wq")
  end
end)

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- to investigate
-- vim.keymap.set("n", "<leader>K", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader>J", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Substitute word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go to plugins
vim.keymap.set("n", "<leader>x", "<cmd>e ~/.config/nvim/lua/vanilla/packer.lua<CR>");

-- Make it rain
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)