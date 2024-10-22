return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				disable = { "c", "rust" }, -- Wyłącz dla wybranych języków
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python", "html" }, -- Wyłącz wcięcia dla niektórych języków
			},
			autotag = {
				enable = true,
				filetypes = { "html", "xml", "vue", "typescriptreact", "javascriptreact", "svelte" },
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"nix",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"vue",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			auto_install = true, -- Automatyczne instalowanie brakujących parserów
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
