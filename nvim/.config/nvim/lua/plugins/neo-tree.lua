return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle left<CR>", { noremap = true, silent = true })
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				hijack_netrw_behavior = "open_current",
				follow_current_file = {
					enabled = true,
				},
				buffers = {
					close_if_last_window = true,
				},
				hijack_netrw_behavior = "open_current",
			},
		})
	end,
}
