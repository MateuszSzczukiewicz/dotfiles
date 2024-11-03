return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
		local harpoon = require("harpoon")

		harpoon.setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		})

   local toggle_opts = {
        border = "rounded",
        title_pos = "center",
        ui_width_ratio = 0.40,
    }

		vim.keymap.set("n", "<A-a>", function()
			harpoon:list():add()
		end)
	  vim.keymap.set("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)
		vim.keymap.set("n", "<A-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-4>", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<A-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<A-n>", function()
			harpoon:list():next()
		end)
	end,
}
