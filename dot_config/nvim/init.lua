-- ~/.config/nvim/init.lua — entry point.
-- Loads options → keymaps → lazy.nvim → plugin specs in lua/plugins/.

vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.lazy")

-- Extension point — loaded if present. Overlay repos (private) may drop
-- ~/.config/nvim/lua/local/init.lua with extra config, plugins, or keymaps.
pcall(require, "local")
