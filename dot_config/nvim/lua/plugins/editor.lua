return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep"  },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers"    },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help"       },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Recent"     },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config   = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },

  -- Treesitter — syntax-aware highlighting / indent
  -- Pin to `master` branch: the new `main` branch (v1.0) removed the
  -- `nvim-treesitter.configs` module that this opts block relies on.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash", "json", "yaml", "toml",
        "markdown", "markdown_inline", "gitcommit", "gitignore",
        "go", "python", "typescript", "javascript", "tsx", "html", "css",
      },
      highlight = { enable = true },
      indent    = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- editorconfig support is built into Neovim ≥ 0.9.

  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "vue", "javascriptreact", "typescriptreact" },
  },

  { "tpope/vim-eunuch", cmd = { "Rename", "Delete", "Move", "Mkdir", "SudoWrite" } },

  -- which-key — discover keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
