local map = vim.keymap.set

map("n", ";",  "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Quality of life
map("n", "<leader>w", "<cmd>write<cr>",  { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>",   { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear hlsearch" })

-- Better window motion
map("n", "<c-h>", "<c-w>h", { desc = "Window left" })
map("n", "<c-j>", "<c-w>j", { desc = "Window down" })
map("n", "<c-k>", "<c-w>k", { desc = "Window up" })
map("n", "<c-l>", "<c-w>l", { desc = "Window right" })

-- Center cursor on jumps
map("n", "n",   "nzzzv")
map("n", "N",   "Nzzzv")
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")

-- Move lines with Alt-j/k
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- Stay in indent mode after </>
map("v", "<", "<gv")
map("v", ">", ">gv")
