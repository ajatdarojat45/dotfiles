return {
	"github/copilot.vim",
	event = "InsertEnter",
	init = function()
		-- Disable default <Tab> mapping
		vim.g.copilot_no_tab_map = true

		-- Enable Copilot for all filetypes
		vim.g.copilot_filetypes = {
			["*"] = true,
		}
	end,
	config = function()
		-- Accept Copilot suggestion
		vim.keymap.set(
			"i",
			"<C-J>",
			'copilot#Accept("<CR>")',
			{ silent = true, expr = true }
		)
	end,
}
