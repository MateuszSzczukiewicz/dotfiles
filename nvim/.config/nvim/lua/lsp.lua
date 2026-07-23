-- LSP installation methods:
-- ruff        -> mise use -g aqua:astral-sh/ruff
-- vtsls       -> mise use -g npm:@vtsls/language-server
-- bashls      -> mise use -g npm:bash-language-server
-- gopls       -> mise use -g go:golang.org/x/tools/gopls
-- lua_ls      -> mise use -g lua-language-server
-- zls         -> mise use -g zls
-- efm         -> mise use -g go:github.com/mattn/efm-langserver
-- helm_ls     -> mise use -g go:github.com/mrjosh/helm-ls
-- texlab      -> sudo xbps-install -Sy texlab
-- clangd      -> sudo xbps-install -Sy clang-tools-extra
-- bacon_ls    -> cargo install bacon-ls
-- vhdl_ls     -> cargo install vhdl_ls
-- ruby_lsp    -> gem install ruby-lsp
-- metals      -> cs install metals
-- clojure_lsp -> download from github.com/clojure-lsp/clojure-lsp
-- phpactor    -> download phpactor.phar from github.com/phpactor/phpactor
-- jdtls       -> download from download.eclipse.org/jdtls/snapshots/
-- csharp_ls   -> dotnet tool install -g csharp-ls
-- elixirls    -> mise install aqua:elixir-lsp/elixir-ls
-- scheme_langserver -> download from github.com/ufo5260987423/scheme-langserver

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
