vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-rhubarb" },
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/tpope/vim-sleuth" },
    { src = "https://github.com/tpope/vim-unimpaired" },
    { src = "https://github.com/tpope/vim-eunuch" },
    { src = "https://github.com/tpope/vim-rsi" },
    { src = "https://github.com/mbbill/undotree" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/Saghen/blink.cmp" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range('^9') },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim", version = vim.version.range('^0.15') },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/numToStr/Comment.nvim" },
    { src = "https://github.com/mg979/vim-visual-multi" },
    { src = "https://github.com/monaqa/dial.nvim" },
    { src = "https://github.com/Wansmer/treesj" },
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
    { src = "https://github.com/RRethy/vim-illuminate" },
    { src = "https://github.com/chrisgrieser/nvim-spider" },
    { src = "https://github.com/chentoast/marks.nvim" },
    { src = "https://github.com/haya14busa/vim-asterisk" },
    { src = "https://github.com/direnv/direnv.vim" },
    { src = "https://github.com/akinsho/git-conflict.nvim" },
    { src = "https://github.com/andymass/vim-matchup" },
    { src = "https://github.com/ggandor/leap.nvim" },
    { src = "https://github.com/ggandor/flit.nvim" },
    { src = "https://github.com/tpope/vim-obsession" },
    { src = "https://github.com/kevinhwang91/nvim-bqf" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
    { src = "https://github.com/tpope/vim-dispatch" },
    { src = "https://github.com/gaoDean/autolist.nvim" },
})

require('gitsigns').setup({})

require('nvim-treesitter').setup({
    highlight = { enable = true },
    auto_install = true,
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
        documentation = { auto_show = true },
    },
})


require('lazydev').setup({
    library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
})

require('mini.ai').setup({})
require('mini.surround').setup({})
require('mini.trailspace').setup({})

require('nvim-autopairs').setup({})
require('Comment').setup({})

require('todo-comments').setup({})
require('trouble').setup({})

require('dial.config').augends:register_group({
    default = {
        require('dial.augend').integer.alias.decimal,
        require('dial.augend').integer.alias.hex,
        require('dial.augend').date.alias['%Y/%m/%d'],
        require('dial.augend').date.alias['%Y-%m-%d'],
        require('dial.augend').constant.alias.bool,
        require('dial.augend').constant.new({ elements = { 'let', 'const' } }),
    },
})

require('treesj').setup({ use_default_keymaps = false })

require('dap')

require('treesitter-context').setup({
    max_lines = 3,
    trim_scope = 'outer',
    mode = 'cursor',
})

require('nvim-highlight-colors').setup({
    render = 'background',
    enable_named_colors = true,
    enable_tailwind = false,
})

require('illuminate').configure({
    providers = { 'lsp', 'treesitter', 'regex' },
    delay = 100,
    under_cursor = true,
})

require('marks').setup({})

require('git-conflict').setup({})

require('leap').setup({})
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'gS', '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'g|', '<Plug>(leap-from-window)')

require('flit').setup({
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    labeled_modes = 'v',
    multiline = true,
    opts = {},
})

vim.g.matchup_matchparen_offscreen = { method = 'popup' }

require('bqf').setup({
    auto_enable = true,
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border = 'none',
        show_title = false,
    },
    func_map = {
        vsplit = '',
        ptogglemode = 'z,',
        stoggleup = '',
    },
    filter = {
        fzf = {
            action_for = { ['ctrl-s'] = 'split' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
        },
    },
})

require('nvim-ts-autotag').setup({})

require('autolist').setup({
    enabled = true,
    list_capital = false,
    colon = { indent_raw = true, indent = true, precedes = 'list' },
    invert = { toggles_checkbox = true },
    lists = {
        markdown = { 'unordered', 'ordered', 'digit', 'checkbox' },
        text = { 'unordered', 'ordered', 'digit', 'checkbox' },
        tex = { 'unordered', 'ordered', 'digit', 'checkbox' },
    },
    recal_hooks = {
        'Invert',
        'New',
    },
})

vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ['rust-analyzer'] = {
                checkOnSave = { command = 'clippy' },
                cargo = { features = 'all' },
                procMacro = { enable = true },
            },
        },
    },
    tools = {
        test_executor = 'background',
    },
}

require('conform').setup({
    formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        go = { "gofmt", "goimports" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        zig = { "zigfmt" },
        sh = { "shfmt" },
        elixir = { "mix" },
        php = { "php_cs_fixer" },
    },
    format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
    },
})

require('nvim-treesitter-textobjects').setup({
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']f'] = '@function.outer',
                [']c'] = '@class.outer',
            },
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[c'] = '@class.outer',
            },
        },
    },
})
