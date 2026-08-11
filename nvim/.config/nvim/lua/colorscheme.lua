vim.pack.add({ { src = "https://github.com/blazkowolf/gruber-darker.nvim" } })

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
