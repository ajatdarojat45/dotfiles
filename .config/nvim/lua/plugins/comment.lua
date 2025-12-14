return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("Comment").setup()

		vim.keymap.set(
			"n",
			"<leader>cc",
			"<Plug>(comment_toggle_linewise_current)",
			{ silent = true }
		)
	end,
}
