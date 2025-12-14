return {
	"ayu-theme/ayu-vim",
	priority = 1000, -- load before other UI plugins
	init = function()
		-- MUST be set before colorscheme is loaded
		vim.g.ayucolor = "light"
	end,
	config = function()
		vim.cmd.colorscheme("ayu")
	end,
}
