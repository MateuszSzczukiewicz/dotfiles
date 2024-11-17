return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),

      toggler = {
        line = "<leader>/",
        block = "<leader>?",
      },
      opleader = {
        line = "<leader>/",
        block = "<leader>?",
      },
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
    })

    vim.keymap.set("n", "<leader>ci", function()
      vim.cmd("CommentToggle")
    end, { desc = "Toggle inline comment" })
  end,
}
