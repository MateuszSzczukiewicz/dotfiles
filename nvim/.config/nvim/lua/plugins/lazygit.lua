return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    { "<leader>lcf", "<cmd>LazyGitCurrentFile<CR>", desc = "LazyGit current file" },
    { "<leader>lff", "<cmd>LazyGitFilterCurrentFile<CR>", desc = "Filter commits for current file" },
  },

  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1.0
    vim.g.lazygit_use_neovim_remote = true

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyGitQuit",
      callback = function()
        vim.cmd("close")
      end,
    })
  end,
}
