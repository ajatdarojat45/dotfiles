return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>cc",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			desc = "Toggle comment",
		},
	},
	config = function()
		require("Comment").setup()
	end,
}
