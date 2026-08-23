vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

local langs = { "rust", "lua", "vim", "vimdoc", "bash", "markdown" }
local fts = { "rust", "lua", "vim", "vimdoc", "sh", "markdown" }

require("nvim-treesitter").setup({})
require("nvim-treesitter").install(langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = fts,
	callback = function()
		vim.treesitter.start()
	end,
})
