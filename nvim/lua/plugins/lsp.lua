return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
        "css",
        "javascript",
        "typescript",
      })
    end,
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prettierd",
        "typescript-language-server", -- Ensure TypeScript LSP is installed
        "html-lsp",
        "css-lsp",
        "emmet-ls",
      })
    end,
  },
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript/JavaScript Language Server
        ts_ls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = false,
              },
            },
          },
        },
        -- HTML Language Server (only for HTML files)
        html = {
          filetypes = { "html", "ejs" },
        },
        -- Emmet for HTML/CSS
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "ejs",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
        -- CSS Language Server
        cssls = {
          filetypes = { "css", "scss", "less" },
        },
      },
    },
  },
}
