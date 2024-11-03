return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
	},
	config = function()
		local gopher = require("gopher")

		gopher.setup({
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "gotests",
				iferr = "iferr",
			},
		})

		vim.keymap.set("n", "<leader>gi", ":GoInstallDeps<CR>", { desc = "Install Go dependencies" })
		vim.keymap.set("n", "<leader>gt", ":GoTest<CR>", { desc = "Run Go tests" })
		vim.keymap.set("n", "<leader>gc", ":GoCoverage<CR>", { desc = "Check Go test coverage" })
		vim.keymap.set("n", "<leader>gf", ":GoFmt<CR>", { desc = "Format Go code" })
		vim.keymap.set("n", "<leader>gd", ":GoDoc<CR>", { desc = "Open Go documentation" })
		vim.keymap.set("n", "<leader>gr", ":GoRun<CR>", { desc = "Run Go program" })

		local dap = require("dap")
		dap.adapters.go = {
			type = "executable",
			command = "dlv",
			args = { "dap" },
		}
		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug Package",
				request = "launch",
				program = "${fileDirname}",
			},
		}

		vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Start/Continue Debugging" })
		vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { desc = "Step Into" })
		vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", { desc = "Step Over" })
		vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Open REPL" })
	end,
}
