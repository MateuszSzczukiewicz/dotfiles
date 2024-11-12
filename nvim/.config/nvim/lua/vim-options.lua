vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = ""
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })
