return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    })

    local toggle_opts = {
      border = "rounded",
      title_pos = "center",
      ui_width_ratio = 0.40,
    }

    vim.keymap.set("n", "<A-a>", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<A-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    end)

    for i = 1, 9 do
      vim.keymap.set("n", "<A-" .. i .. ">", function()
        harpoon:list():select(i)
      end)
    end
    vim.keymap.set("n", "<A-0>", function()
      harpoon:list():select(10)
    end)

    vim.keymap.set("n", "<A-p>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<A-n>", function()
      harpoon:list():next()
    end)
  end,
}
