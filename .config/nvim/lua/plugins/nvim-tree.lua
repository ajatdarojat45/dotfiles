return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	-- IMPORTANT: load on these triggers
	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeRefresh",
	},

	keys = {
		{ "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "NvimTree Focus" },
		{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree Toggle" },
		{ "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "NvimTree Find File" },
		{ "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "NvimTree Refresh" },
	},

	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
				side = "left",
			},
			git = {
				enable = true,
			},
			renderer = {
				group_empty = true,
				highlight_git = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					show = {
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}
