return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return name:sub(1, 1) == "." or name:match("~$")
				end,
			},
			float = {
				padding = 2,
				max_width = 100,
				max_height = 20,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
		})

		vim.keymap.set("n", "-", oil.toggle_float, { desc = "Toggle Oil floating window" })
		vim.keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "Open Oil" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.keymap.set("n", "<Esc>", function()
					if vim.bo.filetype == "oil" then
						vim.cmd("close")
					end
				end, { buffer = true, desc = "Close Oil floating window" })
			end,
		})
	end,
}
