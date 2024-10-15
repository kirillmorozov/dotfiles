-- Collection of various small independent plugins/modules
return {
	{
		"echasnovski/mini.nvim",
		config = function(_, opts)
			for plugin, options in pairs(opts) do
				require("mini." .. plugin).setup(options)
			end
		end,
		event = "UIEnter",
		-- NOTE(kirillmorozov): opts is a table that holds config options for mini
		-- modules.
		opts = {
			comment = {
				mappings = {
					comment_line = "<C-c>",
					comment_visual = "<C-c>",
				},
			},
			diff = {},
			git = {},
			statusline = { use_icons = true },
			surround = {},
		},
	},
}
