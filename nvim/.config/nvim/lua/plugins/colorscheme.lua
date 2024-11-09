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
    vim.cmd("highlight statusline guifg=#ffffff guibg=" .. base)
    vim.cmd("highlight statuslinenc guifg=#7c7c7c guibg=" .. base)

    local function get_git_branch()
      local handle = io.popen("git branch --show-current 2>/dev/null")
      if handle then
        local branch = handle:read("*a"):gsub("\n", "")
        handle:close()
        return branch
      end
      return ""
    end

    vim.o.statusline = "%#StatusLine# %f %m"
    vim.o.statusline = vim.o.statusline .. " %=" .. " " .. get_git_branch()
  end,
}
