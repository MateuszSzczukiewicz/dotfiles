return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      dark_variant = "main",
      disable_background = false,
      disable_float_background = false,
      disable_italics = true,
    })
    vim.cmd("colorscheme rose-pine")

    local base = "#191724"
    vim.cmd("highlight statusline guibg=" .. base)
    vim.cmd("highlight statuslinenc guibg=" .. base)
  end,
}
