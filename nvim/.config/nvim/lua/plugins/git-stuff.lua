return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				numhl = true,
				current_line_blame = false,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					vim.keymap.set("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr, desc = "Next Hunk" })

					vim.keymap.set("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr, desc = "Previous Hunk" })

					vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
					vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo Stage Hunk" })
					vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Blame Line" })

					vim.keymap.set("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
				end,
			})
		end,
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
		config = function()
			vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
			vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git Diff Split" })
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })
		end,
	},
}
