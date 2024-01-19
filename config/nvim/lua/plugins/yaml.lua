return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        -- Have to add this for yamlls to understand that we support line folding
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.yaml.schemas =
            vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = false,
            },
            validate = true,
            schemaStore = {
              -- Must disable built-in schemaStore support to use
              -- schemas from SchemaStore.nvim plugin
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
          },
        },
      },
      azure_pipelines_ls = {
        settings = {
          yaml = {
            format = {
              enable = false,
              printWidth = 120,
            },
            validate = true,
            completion = true,
          },
        },
      },
    },
    setup = {
      yamlls = function()
        -- Neovim < 0.10 does not have dynamic registration for formatting
        if vim.fn.has("nvim-0.10") == 0 then
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "yamlls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end
      end,
      azure_pipelines_ls = function()
        if vim.fn.has("nvim-0.10") == 0 then
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "azure_pipelines_ls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end
      end,
    },
  },
}
