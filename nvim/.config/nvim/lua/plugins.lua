vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = 'https://github.com/vague-theme/vague.nvim' },
    { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
})


require("gruber-darker").setup({
-- require("vague").setup({
    transparent = true,
    bold = false,
    -- italic = false,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
})
--
vim.cmd.colorscheme("gruber-darker")
-- vim.cmd.colorscheme('vague')
