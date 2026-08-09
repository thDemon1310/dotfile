-- adding leader key
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader><ESC>", ":nohl<CR>", { desc = "Clear search highlight" })

-- window management
keymap.set("n", "<A-w>v", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<A-w>e", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<A-w>q", "<C-w>q", { desc = "Close current split" })

keymap.set("n", "<A-t>o", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<A-t>q", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<A-t>n", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<A-t>p", ":tabp<CR>", { desc = "Go to previous tab" })

-- for moving selected line up and down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })

-- for wraping the word
keymap.set("n", "<A-x>", ":set wrap!<CR>", { desc = "Toggle line wrap" })

-- for the indent and unindent
keymap.set("v", "<", "<gv", { desc = "Unindent and keep seletection" })
keymap.set("v", ">", ">gv", { desc = "Indent and keep seletection" })

-- native undotree
keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle builtin UndoTree" })

-- Disable arrow keys in Normal, Insert, Visual, and Select modes
local disable_arrows = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(disable_arrows) do
	vim.keymap.set({ "n", "v", "x", "i" }, key, "<Nop>", { noremap = true, silent = true })
end

-- for keeping the cursor at the center
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half page with cursor in middle" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half page with cursor in middle" })

-- remap for pasting
keymap.set("x", "<leader>p", '"_dp')
