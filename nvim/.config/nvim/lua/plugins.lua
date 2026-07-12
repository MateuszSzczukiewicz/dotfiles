vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

require("gruber-darker").setup({
    bold = false,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
})

vim.cmd.colorscheme("gruber-darker")
