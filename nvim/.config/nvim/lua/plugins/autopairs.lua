return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "vim" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    autopairs.add_rules({
      Rule("$$", "$$", "tex"):with_pair(function(opts)
        local line = opts.line
        local pos = opts.col
        return line:sub(pos - 1, pos) ~= "$$"
      end),
      Rule(" ", " ")
        :with_pair(function(opts)
          return opts.prev_char:match("[%{%(%[]") ~= nil
        end)
        :with_move(function(opts)
          return opts.char == " "
        end)
        :with_del(function(opts)
          return opts.char == " "
        end),
      Rule("", " )")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.char == ")"
        end)
        :use_key(")"),
      Rule("", " }")
        :with_pair(function()
          return false
        end)
        :with_move(function(opts)
          return opts.char == "}"
        end)
        :use_key("}"),
    })
  end,
}
