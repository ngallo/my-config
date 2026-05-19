-- "Pro" QoL plugins. None of these are essential, but together they make
-- the editor feel like a 2026 tool, not a 2014 one.

return {
  -- Edit your filesystem like a buffer (modern alt. to nvim-tree for in-place ops)
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent dir (oil)" },
    },
    opts = {
      delete_to_trash = true,
      view_options    = { show_hidden = true },
    },
  },

  -- File bookmarks — pin N files, jump with <leader>1..9
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local h = require("harpoon")
      return {
        { "<leader>a", function() h:list():add() end,                 desc = "Harpoon add" },
        { "<leader>e", function() h.ui:toggle_quick_menu(h:list()) end, desc = "Harpoon menu" },
        { "<leader>1", function() h:list():select(1) end, desc = "Harpoon 1" },
        { "<leader>2", function() h:list():select(2) end, desc = "Harpoon 2" },
        { "<leader>3", function() h:list():select(3) end, desc = "Harpoon 3" },
        { "<leader>4", function() h:list():select(4) end, desc = "Harpoon 4" },
        { "<leader>5", function() h:list():select(5) end, desc = "Harpoon 5" },
      }
    end,
    config = function() require("harpoon"):setup() end,
  },

  -- Diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs / defs / impls" },
    },
    opts = {},
  },

  -- Formatter framework
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd   = { "ConformInfo" },
    keys  = {
      { "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format buffer" },
    },
    opts = {
      formatters_by_ft = {
        lua        = { "stylua" },
        sh         = { "shfmt" },
        bash       = { "shfmt" },
        zsh        = { "shfmt" },
        python     = { "ruff_format", "ruff_fix" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json       = { "prettier" },
        yaml       = { "prettier" },
        markdown   = { "prettier" },
        css        = { "prettier" },
        html       = { "prettier" },
      },
      format_on_save = { timeout_ms = 1500, lsp_fallback = true },
    },
  },

  -- Highlight TODO/FIXME/HACK/NOTE/WARN/PERF/TEST
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
    },
    opts = {},
  },

  -- LSP progress notification (replaces stock "Loading…" with a corner spinner)
  { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main  = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts  = { scope = { enabled = true } },
  },

  -- Better `f/F/t/T` + `s`-jump anywhere on screen
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts  = {},
    keys  = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,        desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- Auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts  = { check_ts = true },
  },

  -- git inside nvim — :LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd  = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Better diagnostics signs / virtual text
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false })  -- inline plugin handles it
    end,
  },
}
