return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      vue = { "eslint_d" },
      python = { "ruff", "mypy" },
      nix = { "nix" },
      go = { "golangcilint" },
      gomod = { "golangcilint" },
      lua = { "selene" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.diagnostic.config({
      virtual_text = true,
      float = {
        source = "always",
        border = "rounded",
      },
      severity_sort = true,
      underline = true,
    })

    local function get_highlight_fg(group)
      local hl = vim.api.nvim_get_hl_by_name(group, true)
      return hl and hl.foreground and string.format("#%06x", hl.foreground) or nil
    end

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = get_highlight_fg("DiagnosticError"), bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = get_highlight_fg("DiagnosticWarn"), bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = get_highlight_fg("DiagnosticInfo"), bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = get_highlight_fg("DiagnosticHint"), bg = "none" })

    vim.keymap.set("n", "<leader>n", function()
      vim.diagnostic.open_float(0, { scope = "buffer" })
    end, { desc = "Show diagnostics in a floating window" })

    vim.keymap.set("n", "<leader>q", function()
      vim.diagnostic.setloclist({ open = true })
    end, { desc = "Show diagnostics in loclist" })
  end,
}
