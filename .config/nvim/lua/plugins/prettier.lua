return {
	"MunifTanjim/prettier.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local prettier = require("prettier")

		prettier.setup({
			bin = "prettierd", -- or "prettier"
			["null-ls"] = {
				condition = function()
					return prettier.config_exists({
						check_package_json = true,
					})
				end,
				runtime_condition = function(_)
					return true
				end,
				timeout = 5000,
			},
			filetypes = {
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"markdown",
				"scss",
				"typescript",
				"typescriptreact",
				"yaml",
				"jsx",
				"go",
				"lua",
			},
		})
	end,
}
