return {
	"folke/tokyonight.nvim",
	lazy = false, -- 🔴 must load immediately
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})
	end,
}
