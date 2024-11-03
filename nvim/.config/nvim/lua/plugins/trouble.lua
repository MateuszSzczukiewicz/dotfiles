return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		position = "bottom",
		height = 10,
		icons = true,
		mode = "workspace_diagnostics",
		fold_open = "",
		fold_closed = "",
		action_keys = {
			close = "q",
			cancel = "<esc>",
			refresh = "r",
			jump = { "<cr>", "<tab>" },
			open_split = { "<c-x>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
			jump_close = { "o" },
			toggle_mode = "m",
			toggle_preview = "P",
			hover = "K",
			preview = "p",
			close_folds = { "zM", "zm" },
			open_folds = { "zR", "zr" },
			toggle_fold = { "zA", "za" },
			previous = "k",
			next = "j",
		},
		auto_open = false,
		auto_close = false,
		auto_preview = true,
		use_diagnostic_signs = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggle trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle trouble document diagnostics" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Toggle trouble quickfix list" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Toggle trouble location list" },
		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
}
