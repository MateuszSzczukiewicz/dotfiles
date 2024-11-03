return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"emmet_ls",
					"jsonls",
					"bashls",
					"yamlls",
					"html",
					"tailwindcss",
					"pyright",
					"gopls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
				vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
			end

			local servers = {
				lua_ls = {},
				ts_ls = {},
				emmet_ls = {},
				jsonls = {},
				bashls = {},
				yamlls = {},
				html = {},
				tailwindcss = {},
				pyright = { filetypes = { "python" } },
				gopls = {
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					cmd = { "gopls" },
					root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end
		end,
	},
}
