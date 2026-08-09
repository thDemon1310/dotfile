-- making global variables
local opt = vim.opt

vim.g.netrw_banner = false
opt.termguicolors = true

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false
opt.smartindent = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true

opt.clipboard:append("unnamedplus")
opt.isfname:append("@-@")
opt.guicursor = ""
opt.scrolloff = 8

opt.signcolumn = "yes"
-- opt.cmdheight = 0

-- cursorline
opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanked (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
