return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    default_mappings = true,
    refresh_interval = 250,
    cyclic = true,
    signs = true,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    bookmark_0 = {
      sign = "⚑",
      virt_text = "Marker",
      virt_text_pos = "eol",
      virt_text_highlight = "Comment",
    },
    mappings = {
      toggle = "mm",
      next = "mn",
      prev = "mp",
      delete_buf = "md",
    },
  },
}
