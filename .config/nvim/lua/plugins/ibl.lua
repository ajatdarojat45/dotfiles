return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local scope_hl = "focus"
		local indent_hl = "passive"

		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, scope_hl, { fg = "#7486bd" })
			vim.api.nvim_set_hl(0, indent_hl, { fg = "#41425e" })
		end)

		require("ibl").setup({
			scope = {
				highlight = scope_hl,
			},
			indent = {
				highlight = indent_hl,
				char = "│",
			},
		})
	end,
}
