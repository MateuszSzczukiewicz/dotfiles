return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File                    ", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  Toggle File Explorer        ", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  Find File                   ", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  Find Word                   ", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  Restore Session             ", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  Quit                        ", "<cmd>qa<CR>"),
    }

    local function button_highlight()
      vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#83a598", bold = true })
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#d3869b", bold = true })
    end
    button_highlight()

    dashboard.section.header.opts.hl = "AlphaHeader"
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButton"
    end

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
