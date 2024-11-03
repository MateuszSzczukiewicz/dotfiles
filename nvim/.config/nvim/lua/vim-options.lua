vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = ""
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "

vim.opt.swapfile = false

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<C-v>", '"+p', { desc = "Paste from system clipboard" })

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select all" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
