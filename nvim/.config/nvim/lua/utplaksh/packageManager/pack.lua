vim.pack.add({
	-- Color scheme
	"https://github.com/rebelot/kanagawa.nvim",
	-- web devicons
	"https://github.com/nvim-tree/nvim-web-devicons",
	-- file icons
	"https://github.com/nvim-mini/mini.icons",
	-- lua line
	"https://github.com/nvim-lualine/lualine.nvim",
	-- git intigration
	"https://github.com/lewis6991/gitsigns.nvim",
	-- indent line
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	-- lazygit plugin
	"https://github.com/kdheepak/lazygit.nvim",
	-- == TreeSitter ==
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

require("utplaksh.packageManager.plugins.colorTheme")
require("utplaksh.packageManager.plugins.luaLine")
require("utplaksh.packageManager.plugins.telescope")
require("utplaksh.packageManager.plugins.treesitter")
require("utplaksh.packageManager.plugins.indent")
require("utplaksh.packageManager.plugins.blink")
require("utplaksh.packageManager.plugins.lsp")
require("utplaksh.packageManager.plugins.conform")
require("utplaksh.packageManager.plugins.image")
require("utplaksh.packageManager.plugins.autoTag")
require("utplaksh.packageManager.plugins.colorPallet")
require("utplaksh.packageManager.plugins.oilFileExplore")

-- Open LazyGit floating window
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
