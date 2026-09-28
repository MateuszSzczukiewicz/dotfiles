vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

vim.cmd.packadd("nvim-lspconfig")

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.cmd("set completeopt+=noselect")

vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})

vim.lsp.enable("ruff")

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--compile-commands-dir=build",
		"--background-index",
		"--completion-style=detailed",
		"--header-insertion=never",
		"--all-scopes-completion",
		"--cross-file-rename",
		"--enable-config", -- reads .clangd files
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = { ".clangd", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
})

vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			check = {
				command = "clippy",
			},
		},
	},
})

vim.lsp.enable("rust_analyzer")
