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

    -- Funkcja do uzyskania nazwy brancha Git
    local function get_git_branch()
      local handle = io.popen("git branch --show-current 2>/dev/null")
      if handle then
        local branch = handle:read("*a"):gsub("\n", "")
        handle:close()
        return branch
      end
      return ""
    end

    -- Ustawienia statusline
    vim.o.laststatus = 2 -- Włącza statusline tylko dla aktywnego okna
    vim.o.statusline = "%#StatusLine# %f %m" -- Nazwa pliku i modyfikacja
    vim.o.statusline = vim.o.statusline .. " %=" .. " " .. get_git_branch()
  end,
}
