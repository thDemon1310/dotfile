vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
})

require("colorizer").setup({
	filetypes = { "*" }, -- highlight in every filetype, including your ghostty config
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		names = false,
		RRGGBBAA = true,
		mode = "virtualtext", -- draws the swatch as virtual text, not a background highlight
		virtualtext = "■ ", -- the block character shown before the code
		virtualtext_inline = true, -- places it right before the match, like Claude's chat
	},
})
