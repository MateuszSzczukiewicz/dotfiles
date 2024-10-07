-- return {
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--   },
--   {
--     "nvim-telescope/telescope.nvim",
--     tag = "0.1.5",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("telescope").setup({
--         pickers = {
--           find_files = {
--             hidden = true,
--             theme = "ivy",
--           },
--         },
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown({}),
--           },
--         },
--       })
--       local builtin = require("telescope.builtin")
--       vim.keymap.set("n", "<C-p>", builtin.find_files, {})
--       vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
--       vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
--
--       require("telescope").load_extension("ui-select")
--     end,
--   },
-- }

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				file_ignore_patterns = {},
				hidden = true,
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
