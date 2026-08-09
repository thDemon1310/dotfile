vim.pack.add({
	-- adding the autotag completing plugin--
	"https://github.com/windwp/nvim-ts-autotag",
})

local autoTag = require("nvim-ts-autotag")

autoTag.setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})
