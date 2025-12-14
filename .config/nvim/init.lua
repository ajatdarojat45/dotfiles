-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Core settings (NO plugins here)
-----------------------------------------------------------
require("settings")

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
})

-----------------------------------------------------------
-- 🔴 APPLY COLORSCHEME AFTER lazy loads plugins
-- (NO flicker, plugin is available)
-----------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Safe apply (prevents errors)
pcall(vim.cmd.colorscheme, "tokyonight-moon")
