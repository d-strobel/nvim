-- set leader key to space
vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap

-- Move multilines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centralize while going page up and down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Void registry pasting
keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Paste form system clipboard
keymap.set({ "n", "v" }, "<leader>p", [["+p]])
keymap.set("n", "<leader>P", [["+P]])

-- Delete to void registry
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
