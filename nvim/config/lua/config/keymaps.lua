-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- do not yank
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "v" }, "p", '"_dP')

-- -- tab
-- vim.keymap.set({ "n" }, "<Tab>", ">>")
-- vim.keymap.set({ "n" }, "<S-Tab>", "<<")
-- vim.keymap.set({ "v" }, "<Tab>", ">gv")
-- vim.keymap.set({ "v" }, "<S-Tab>", "<gv")

-- delete word
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-h>", "<C-w>")
