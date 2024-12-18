return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "python", "html" },
      },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "nix",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "vue",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "python",
      },
      auto_install = true,
    })

    require("nvim-ts-autotag").setup({
      filetypes = { "html", "xml", "vue", "typescriptreact", "javascriptreact", "svelte" },
    })
  end,
}
