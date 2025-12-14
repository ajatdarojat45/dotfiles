return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/flash.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
	},
	config = function()
		local actions = require("telescope.actions")

		----------------------------------------------------------------
		-- Flash.nvim integration for Telescope
		----------------------------------------------------------------
		local function flash(prompt_bufnr)
			require("flash").jump({
				pattern = "^",
				label = { after = { 0, 0 } },
				search = {
					mode = "search",
					exclude = {
						function(win)
							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
								~= "TelescopeResults"
						end,
					},
				},
				action = function(match)
					local picker =
						require("telescope.actions.state").get_current_picker(prompt_bufnr)
					picker:set_selection(match.pos[1] - 1)
				end,
			})
		end

		----------------------------------------------------------------
		-- Telescope setup
		----------------------------------------------------------------
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
					},
				},
				mappings = {
					i = {
						["<S-q>"] = actions.close,
						["<S-d>"] = actions.delete_buffer,
						["<C-s>"] = flash,
					},
					n = {
						["<S-q>"] = actions.close,
						["<S-d>"] = actions.delete_buffer,
						["s"] = flash,
					},
				},
			},
			pickers = {
				find_files = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = { theme = "dropdown" },
				colorscheme = {
					enable_preview = true,
					theme = "dropdown",
				},
			},
		})
	end,
}
