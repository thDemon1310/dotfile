vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

local config = {
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}

conform.setup(config)

-- Keymap
vim.keymap.set("n", "<A-F>", function()
	conform.format({
		async = false,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer" })
