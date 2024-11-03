return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "rose-pine/neovim" },
	config = function()
		local lualine = require("lualine")
		local rose_pine = require("rose-pine.palette")

		local my_lualine_theme = {
			normal = {
				a = { bg = rose_pine.love, fg = rose_pine.base, gui = "bold" },
				b = { bg = rose_pine.base, fg = rose_pine.text },
				c = { bg = rose_pine.surface, fg = rose_pine.text },
			},
			insert = {
				a = { bg = rose_pine.iris, fg = rose_pine.base, gui = "bold" },
				b = { bg = rose_pine.base, fg = rose_pine.text },
				c = { bg = rose_pine.surface, fg = rose_pine.text },
			},
			visual = {
				a = { bg = rose_pine.foam, fg = rose_pine.base, gui = "bold" },
				b = { bg = rose_pine.base, fg = rose_pine.text },
				c = { bg = rose_pine.surface, fg = rose_pine.text },
			},
			command = {
				a = { bg = rose_pine.gold, fg = rose_pine.base, gui = "bold" },
				b = { bg = rose_pine.base, fg = rose_pine.text },
				c = { bg = rose_pine.surface, fg = rose_pine.text },
			},
			replace = {
				a = { bg = rose_pine.love, fg = rose_pine.base, gui = "bold" },
				b = { bg = rose_pine.base, fg = rose_pine.text },
				c = { bg = rose_pine.surface, fg = rose_pine.text },
			},
			inactive = {
				a = { bg = rose_pine.overlay, fg = rose_pine.subtle, gui = "bold" },
				b = { bg = rose_pine.overlay, fg = rose_pine.subtle },
				c = { bg = rose_pine.overlay, fg = rose_pine.subtle },
			},
		}

		lualine.setup({
			options = {
				theme = my_lualine_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
