return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 10,
					position = "bottom",
				},
			},
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "⏸️",
					play = "▶️",
					step_into = "⬇️",
					step_over = "⏩",
					step_out = "⬆️",
					terminate = "✖️",
				},
			},
			floating = {
				max_height = 0.3,
				max_width = 0.3,
				border = "rounded",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
		vim.keymap.set("n", "<Leader>dq", function()
			dap.terminate()
			dapui.close()
		end, { desc = "Terminate Debugging" })
	end,
}
