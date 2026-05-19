return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim", opts = {
        ensure_installed = { "lua_ls", "bashls", "pyright", "ts_ls", "gopls" },
      }},
    },
    config = function()
      local caps = vim.lsp.protocol.make_client_capabilities()
      local servers = { "lua_ls", "bashls", "pyright", "ts_ls", "gopls" }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("gd",         vim.lsp.buf.definition,    "Go to definition")
          map("gr",         vim.lsp.buf.references,    "References")
          map("K",          vim.lsp.buf.hover,         "Hover")
          map("<leader>rn", vim.lsp.buf.rename,        "Rename")
          map("<leader>ca", vim.lsp.buf.code_action,   "Code action")
          map("[d",         function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
          map("]d",         function() vim.diagnostic.jump({ count =  1, float = true }) end, "Next diagnostic")
        end,
      })

      for _, srv in ipairs(servers) do
        vim.lsp.config(srv, { capabilities = caps })
        vim.lsp.enable(srv)
      end
    end,
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<c-space>"] = cmp.mapping.complete(),
          ["<cr>"]      = cmp.mapping.confirm({ select = true }),
          ["<tab>"]     = cmp.mapping.select_next_item(),
          ["<s-tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip"  },
          { name = "path"     },
          { name = "buffer"   },
        }),
      })
    end,
  },
}
