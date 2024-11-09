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

    vim.cmd("highlight StatusLine guifg=#ffffff guibg=" .. base)
    vim.cmd("highlight StatusLineNC guifg=#7c7c7c guibg=" .. base)
  end,
}
