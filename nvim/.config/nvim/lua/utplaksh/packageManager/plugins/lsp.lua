vim.pack.add({
	-- === COnfigration for the lsp ===
	-- nvim lsp-config
	"https://github.com/neovim/nvim-lspconfig",
	-- nvim lsp manager mason
	"https://github.com/mason-org/mason.nvim",
	-- mason Lspcongi
	"https://github.com/mason-org/mason-lspconfig.nvim",
	-- Mason tool installer
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})
require("mason").setup()
local lsp_names = {
	"lua_ls",
	"eslint",
	"vtsls",
	"tailwindcss",
	"graphql",
	"html",
}
require("mason-lspconfig").setup({
	ensure_installed = lsp_names,
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"dotenv-linter",
		"css-lsp",
		"docker-language-server",
	},
})
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable(lsp_names)
local keymap = vim.keymap

-- Go to definition
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- Go to declaration
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
-- Show hover documentation
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
-- Find references
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
-- Go to implementation
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
-- Go to type definition
keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
-- Rename symbol
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
-- Code actions
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code actions",
})
-- Show diagnostics for current line
keymap.set("n", "df", vim.diagnostic.open_float, {
	desc = "Line diagnostics",
})
-- Populate quickfix list with diagnostics
keymap.set("n", "<leader>q", vim.diagnostic.setqflist, {
	desc = "Diagnostics to quickfix",
})
