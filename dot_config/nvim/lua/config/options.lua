local o = vim.opt

-- UI
o.number         = true
o.relativenumber = true
o.signcolumn     = "yes"
o.cursorline     = true
o.laststatus     = 3            -- global statusline
o.showmode       = false
o.termguicolors  = true
o.visualbell     = true
o.scrolloff      = 8
o.sidescrolloff  = 8

-- Indent
o.expandtab      = true
o.shiftwidth     = 4
o.tabstop        = 4
o.softtabstop    = 4
o.smartindent    = true

-- Search
o.ignorecase     = true
o.smartcase      = true
o.inccommand     = "split"

-- Files / undo
o.undofile       = true
o.swapfile       = false
o.backup         = false
o.updatetime     = 250
o.timeoutlen     = 400

-- Split behaviour
o.splitright     = true
o.splitbelow     = true

-- Completion
o.completeopt    = "menu,menuone,noselect"

-- Clipboard
o.clipboard      = "unnamedplus"

-- Whitespace visualisation
o.list           = true
o.listchars      = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Mouse
o.mouse          = "a"
