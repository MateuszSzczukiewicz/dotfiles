return {
  "windwp/nvim-ts-autotag",
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "xml",
    "vue",
    "svelte",
    "markdown",
    "markdown_inline",
  },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
