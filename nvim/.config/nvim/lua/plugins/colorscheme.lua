return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      dark_variant = "main",
      disable_italics = true,
    })
    vim.cmd("colorscheme rose-pine")

    local base = "#000000"
    local white = "#ffffff"
    local gray = "#5c5f70"

    vim.cmd("highlight Normal guibg=" .. base)
    vim.cmd("highlight NormalNC guibg=" .. base)
    vim.cmd("highlight EndOfBuffer guibg=" .. base)
    vim.cmd("highlight LineNr guibg=" .. base)
    vim.cmd("highlight SignColumn guibg=" .. base)
    vim.cmd("highlight CursorLine guibg=" .. base)
    vim.cmd("highlight CursorLineNr guibg=" .. base .. " guifg=" .. white)
    vim.cmd("highlight VertSplit guibg=" .. base .. " guifg=" .. gray)
    vim.cmd("highlight StatusLine guibg=" .. base .. " guifg=" .. gray)
    vim.cmd("highlight StatusLineNC guibg=" .. base .. " guifg=" .. gray)
    vim.cmd("highlight Pmenu guibg=" .. base)
    vim.cmd("highlight PmenuSel guibg=" .. gray)
    vim.cmd("highlight TabLine guibg=" .. base)
    vim.cmd("highlight TabLineFill guibg=" .. base)
    vim.cmd("highlight TabLineSel guibg=" .. base)
    vim.cmd("highlight Folded guibg=" .. base)
    vim.cmd("highlight FloatBorder guibg=" .. base)
    vim.cmd("highlight NormalFloat guibg=" .. base)
    vim.cmd("highlight Visual guibg=" .. gray)
    vim.cmd("highlight Search guibg=" .. gray .. " guifg=" .. white)
    vim.cmd("highlight TelescopeNormal guibg=" .. base)
    vim.cmd("highlight TelescopeBorder guibg=" .. base)
  end,
}
