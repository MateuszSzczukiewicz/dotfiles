return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    local keymap = vim.keymap.set
    keymap("n", "<leader>t", ":TestNearest<CR>", { desc = "Run nearest test" })
    keymap("n", "<leader>T", ":TestFile<CR>", { desc = "Run all tests in file" })
    keymap("n", "<leader>a", ":TestSuite<CR>", { desc = "Run entire test suite" })
    keymap("n", "<leader>l", ":TestLast<CR>", { desc = "Re-run last test" })
    keymap("n", "<leader>g", ":TestVisit<CR>", { desc = "Visit last test file" })

    vim.g["test#strategy"] = "vimux"
    vim.g["test#vimux#orientation"] = "h"
    vim.g["test#vimux#term_position"] = "bottom"
    vim.g["test#vimux#reuse_split"] = true
    vim.g["test#preserve_screen"] = true
  end,
}
