return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			vue = { "eslint_d" },
			python = { "ruff", "mypy" },
			nix = { "nix" },
			go = { "golangcilint" },
			gomod = { "golangcilint" },
			lua = { "selene" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			float = {
				source = "always",
				border = "rounded",
			},
			severity_sort = true,
		})

		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float(0, { scope = "buffer" })
		end, { desc = "Show diagnostics in a floating window" })

		vim.keymap.set("n", "<leader>q", function()
			vim.diagnostic.setloclist({ open = true })
		end, { desc = "Show diagnostics in loclist" })
	end,
}
