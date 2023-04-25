-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = { "lua_ls", "intelephense", "gopls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = { "stylua", "php-cs-fixer", "gofumpt", "goimports", "gomodifytags" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    require("mason-nvim-dap").setup {
      opts = {
        ensure_installed = { "delve", "php" },
        handlers = {
          function(config)
            -- all source with no handlers go past here
            require("mason-nvim-dap").default_setup(config)
          end,
          php = function(config)
            config.configurations = {
              type = "php",
              request = "launch",
              name = "Listen for Xdebug",
              port = 9003,
              pathMappings = {
                ["/var/www/talenta-core"] = "${workspaceFolder}",
              },
            }
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      },
    },
  },
}
