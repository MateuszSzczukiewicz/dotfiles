return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/" },
			auto_save_enabled = true,
			auto_restore_enabled = true,
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
			},
		})

		  vim.keymap.set("n", "<leader>ls", function()
			require("auto-session.session-lens").search_session()
		end, {
			noremap = true,
			silent = true,
			desc = "Search sessions",
		})
	end,
}
