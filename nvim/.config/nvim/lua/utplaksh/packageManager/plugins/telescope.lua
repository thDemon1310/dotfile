vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" then
			vim.fn.system("make -C " .. ev.data.path)
		end
	end,
})


vim.pack.add({
	-- === TELESCOPE & DEPENDENCIES ===
	-- 1. Plenary (Required dependency for Telescope)
	"https://github.com/nvim-lua/plenary.nvim",
	-- 2. Telescope core
	"https://github.com/nvim-telescope/telescope.nvim",
	-- 3. FZF Native (Optional but highly recommended for speed)
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = {
			"node_modules/",
			"%.git/",
			"%.github/",
			"build/",
			"dist/",
			"target/",
			"%.cache",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find string under the cursor" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
