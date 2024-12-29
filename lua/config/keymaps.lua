-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move line up/down in normal and visual modes
vim.keymap.set("n", "<A-Up>", ":move -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":move +1<CR>", { noremap = true, silent = true })

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "<A-Up>", ":move '<-2<CR>gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":move '>+1<CR>gv", { noremap = true, silent = true })
