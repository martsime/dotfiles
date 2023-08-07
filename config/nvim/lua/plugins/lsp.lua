return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff_lsp = {},
      },
      autoformat = true,
    },
    setup = {
      ruff_lsp = function()
        require("lazyvim.util").on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        -- Order of formatters matters. They are used in order of appearance.
        nls.builtins.formatting.ruff,
        nls.builtins.formatting.black,
        -- nls.builtins.formatting.black.with({
        --   extra_args = { "--preview" },
        -- }),
        -- nls.builtins.diagnostics.ruff,
      })
    end,
  },
}
