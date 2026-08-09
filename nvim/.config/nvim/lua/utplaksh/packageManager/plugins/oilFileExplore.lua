vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/malewicz1337/oil-git.nvim",
})

local oil = require("oil")
require("mini.icons").setup()
oil.setup({
	default_file_explorer = true, -- replace netrw entirely (you deleted nvim-tree, so make sure netrw is disabled too)
	columns = { "icon" }, -- needs mini.icons/devicons to show icons at all
	view_options = {
		show_hidden = true, -- dotfiles visible by default
	},
	float = {
		padding = 2,
		max_width = 90,
		max_height = 30,
	},
	keymaps = {
		["<C-h>"] = false, -- unbind if it clashes with window-nav keymaps
		["<C-l>"] = false,
	},
})

require("oil-git").setup({
	show_file_highlights = true,
	show_directory_highlights = true,
	symbol_position = "eol", -- appends status symbols at end of line; no oil column/signcolumn changes needed
	show_ignored_files = true,
	show_ignored_directories = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
