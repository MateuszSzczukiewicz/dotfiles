require('lspconfig')

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', { capabilities = capabilities })

-- Python: ruff (lint/format/LSP) + mypy (type check via efm)
vim.lsp.config('ruff', {
    init_options = {
        settings = { organizeImports = true },
    },
})
vim.lsp.enable('ruff')

vim.lsp.config('efm', {
    filetypes = { 'python' },
    init_options = { documentFormatting = false },
    settings = {
        languages = {
            python = {
                {
                    lintCommand = 'mypy --show-column-numbers --show-error-codes --no-error-summary --no-color-output ${INPUT}',
                    lintFormats = {
                        '%f:%l:%c: %trror: %m',
                        '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m',
                    },
                    lintSource = 'mypy',
                    lintIgnoreExitCode = true,
                },
            },
        },
    },
})
vim.lsp.enable('efm')

-- JS/TS (vtsls = fast modern TypeScript LSP)
vim.lsp.enable('vtsls')

-- Go
vim.lsp.enable('gopls')

-- Rust: rustaceanvim handles rust-analyzer automatically
-- bacon-ls provides fast background diagnostics
vim.lsp.config('bacon_ls', {
    filetypes = { 'rust' },
})
vim.lsp.enable('bacon_ls')

-- C/C++
vim.lsp.enable('clangd')

-- Lua (Neovim)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            diagnostics = { globals = { 'vim' } },
        },
    },
})
vim.lsp.enable('lua_ls')

-- Bash
vim.lsp.enable('bashls')

-- Zig
vim.lsp.enable('zls')

-- LaTeX
vim.lsp.enable('texlab')

-- Helm/Kubernetes
vim.lsp.enable('helm_ls')

-- Java
vim.lsp.enable('jdtls')

-- C#
if vim.fn.executable('csharp-ls') == 1 then
    vim.lsp.enable('csharp_ls')
elseif vim.fn.executable('OmniSharp') == 1 then
    vim.lsp.enable('omnisharp')
end

-- Elixir
vim.lsp.enable('elixirls')

-- Ruby
vim.lsp.enable('ruby_lsp')

-- Scala
vim.lsp.enable('metals')

-- Clojure
vim.lsp.enable('clojure_lsp')

-- PHP (phpactor)
vim.lsp.enable('phpactor')

-- Diagnostics
vim.keymap.set('n', 'gl', function()
    vim.diagnostic.open_float({ scope = 'cursor' })
end, { desc = 'Show line diagnostic' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })

-- LSP keymaps (buffer-local)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
        vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
    end,
})
