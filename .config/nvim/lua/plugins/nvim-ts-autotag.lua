return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,          -- Auto close tags
				enable_rename = true,         -- Auto rename pairs of tags
				enable_close_on_slash = false -- Disable </ auto-close
			},
		})
	end,
}
