return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.header.val = {
			[[  ██████╗ ██╗███████╗███████╗███╗   ███╗██╗██╗     ██╗      █████╗ ██╗ ██╗ ]],
			[[  ██╔══██╗██║██╔════╝██╔════╝████╗ ████║██║██║     ██║     ██╔══██╗██║ ██║ ]],
			[[  ██████╔╝██║███████╗███████╗██╔████╔██║██║██║     ██║     ███████║██████║ ]],
			[[  ██╔══██╗██║╚════██║╚════██║██║╚██╔╝██║██║██║     ██║     ██╔══██║██╔═██║ ]],
			[[  ██████╔╝██║███████║███████╗██║ ╚═╝ ██║██║███████╗███████╗██║  ██║██║ ██║ ]],
			[[  ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚╝ ]],
		}

		startify.section.top_buttons.val = {
			{
				type = "text",
				val = "Quick links",
				opts = {
					hl = "Type",
					shrink_margin = false,
				},
			},
			{ type = "padding", val = 1 },
			startify.button("ee", " New file", "<cmd>ene<CR>"),
			startify.button("ff", " Find file", "<cmd>Telescope find_files<CR>"),
			startify.button("fb", " Switch buffer", "<cmd>Telescope buffers<CR>"),
			startify.button("fg", " Find text", "<cmd>Telescope live_grep<CR>"),
		}

		alpha.setup(startify.config)
	end,
}
