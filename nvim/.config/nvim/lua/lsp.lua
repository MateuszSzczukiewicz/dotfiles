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
