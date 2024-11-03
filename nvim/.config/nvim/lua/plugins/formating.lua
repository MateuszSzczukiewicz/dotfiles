return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				vue = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				liquid = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
				nix = { "alejandra" },
				go = { "goimports", "gofmt" },
			},

			format_on_save = {
				enabled = true,
				allow_filetypes = { "javascript", "typescript", "python", "go", "lua", "json" },
				ignore_filetypes = { "markdown" },
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.keymap.set("n", "<leader>tf", function()
			local enabled = not conform.get_option("format_on_save").enabled
			conform.set_option("format_on_save", { enabled = enabled })
			print("Format on save " .. (enabled and "enabled" or "disabled"))
		end, { desc = "Toggle format on save" })
	end,
}
