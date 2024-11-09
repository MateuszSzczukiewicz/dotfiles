return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "volar",
          "cssls",
          "emmet_ls",
          "jsonls",
          "bashls",
          "yamlls",
          "html",
          "tailwindcss",
          "pyright",
          "gopls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local lspconfig_util = require("lspconfig.util")

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.ts" },
        callback = function()
          vim.cmd("LspRestart")
        end,
      })

      local project_root = lspconfig_util.root_pattern("package.json", ".git")(vim.fn.expand("%:p"))
      local tsdk_path = project_root and (project_root .. "/node_modules/typescript/lib") or nil

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
      end

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        ts_ls = {
          root_dir = lspconfig_util.root_pattern("nuxt.config.ts", "package.json", "tsconfig.json", ".git"),
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
        volar = {
          root_dir = lspconfig_util.root_pattern(
            "vue.config.js",
            "vue.config.ts",
            "nuxt.config.js",
            "nuxt.config.ts",
            "package.json",
            "tsconfig.json",
            ".git"
          ),
          filetypes = { "vue" },
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
            javascript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
          },
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = {
              tsdk = tsdk_path,
            },
          },
          root_dir = project_root,
        },
        cssls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
        },
        emmet_ls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
        },
        jsonls = {},
        bashls = {},
        yamlls = {},
        html = {},
        tailwindcss = {},
        pyright = { filetypes = { "python" } },
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          cmd = { "gopls" },
          root_dir = lspconfig_util.root_pattern("go.work", "go.mod", ".git"),
        },
        svelte = {
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        },
        graphql = {
          filetypes = { "graphql", "gql", "svelte", "vue", "typescriptreact", "javascriptreact" },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end,
  },
}
