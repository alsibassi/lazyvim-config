-- LSP configuration for Python
-- Note: TypeScript and JSON extras are imported in lazy.lua
return {
  -- Python LSP setup: ruff (linting) + basedpyright (types) + pyrefly (completion)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable pyright (using basedpyright instead)
        pyright = { enabled = false },

        -- Ruff: linting only
        ruff = {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            client.server_capabilities.hoverProvider = false
          end,
          init_options = {
            settings = {
              organizeImports = true,
              showSyntaxErrors = true,
              codeAction = {
                disableRuleComment = { enable = false },
                fixViolation = { enable = false },
              },
              lint = { enable = true },
            },
          },
        },

        -- Basedpyright: type checking, hover, code actions
        basedpyright = {
          on_attach = function(client, _)
            client.server_capabilities.completionProvider = false
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.documentHighlightProvider = false
            client.server_capabilities.renameProvider = false
            client.server_capabilities.semanticTokensProvider = false
          end,
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  reportUnknownMemberType = "none",
                },
              },
            },
          },
        },

        -- Pyrefly: fast completion, definitions, semantic tokens
        pyrefly = {
          on_attach = function(client, _)
            client.server_capabilities.codeActionProvider = false
            client.server_capabilities.documentSymbolProvider = false
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.inlayHintProvider = false
            client.server_capabilities.referenceProvider = false
            client.server_capabilities.signatureHelpProvider = false
          end,
        },
      },
    },
  },

  -- Treesitter parsers for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "json",
        "json5",
        "jsonc",
        "python",
      },
      highlight = { enable = true },
    },
  },
}
