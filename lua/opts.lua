-- Tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Linenumbering
vim.o.number = true
vim.o.relativenumber = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Extra files
vim.o.undofile = true

-- Terminal
vim.api.nvim_set_var('terminal_emulator', 'zsh')


-- Folding
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

-- Keymaps
vim.api.nvim_set_keymap('v', '§', "<Esc>i", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '§', "i§", { noremap = false, silent = true });
vim.api.nvim_set_keymap('i', 'jj', "<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', 'jk', "<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'å', "@q", { noremap = false, silent = true });
