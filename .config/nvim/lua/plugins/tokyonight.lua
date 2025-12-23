return {
	"folke/tokyonight.nvim",
	branch = "main",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup()
		vim.cmd("colorscheme tokyonight-moon")
	end,
}
