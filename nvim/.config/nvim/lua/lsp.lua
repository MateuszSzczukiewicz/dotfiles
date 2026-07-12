require("lspconfig")

vim.lsp.config("efm", {
    filetypes = { "python" },
    init_options = { documentFormatting = false },
    settings = {
        languages = {
            python = {
                {
                    lintCommand = "mypy --show-column-numbers --show-error-codes --no-error-summary --no-color-output ${INPUT}",
                    lintFormats = {
                        "%f:%l:%c: %trror: %m",
                        "%f:%l:%c: %tarning: %m",
                        "%f:%l:%c: %tote: %m",
                    },
                    lintSource = "mypy",
                    lintIgnoreExitCode = true,
                },
            },
        },
    },
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--query-driver=" .. vim.fn.expand("~") .. "/workspace/gitlab.pw-sat.pl/oryx-toolchain/bin/*",
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.enable("ruff")
vim.lsp.enable("efm")
vim.lsp.enable("vtsls")
vim.lsp.enable("gopls")
vim.lsp.enable("bacon_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("zls")
vim.lsp.enable("texlab")
vim.lsp.enable("helm_ls")
vim.lsp.enable("jdtls")
vim.lsp.enable("csharp_ls")
vim.lsp.enable("elixirls")
vim.lsp.enable("ruby_lsp")
vim.lsp.enable("metals")
vim.lsp.enable("clojure_lsp")
vim.lsp.enable("phpactor")
vim.lsp.enable("scheme_langserver")
vim.lsp.enable("vhdl_ls")
