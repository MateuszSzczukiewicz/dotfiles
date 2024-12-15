return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")

    oil.setup({
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return name:sub(1, 1) == "." or name:match("~$")
        end,
      },
    })

    local function open_fullscreen_oil()
      local width = vim.o.columns
      local height = vim.o.lines
      local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = 0,
        row = 0,
        style = "minimal",
        border = "none",
      }
      vim.api.nvim_open_win(0, true, opts)
      vim.cmd("Oil")
    end

    vim.keymap.set("n", "<leader>e", open_fullscreen_oil, { desc = "Open Oil in full-screen floating window" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.keymap.set("n", "<Esc>", function()
          vim.cmd("close")
        end, { buffer = true, desc = "Close full-screen Oil window" })
      end,
    })
  end,
}
