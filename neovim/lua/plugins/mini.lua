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
		opts = {
			comment = {},
			diff = {},
			git = {},
			statusline = { use_icons = true },
			surround = {},
		},
	},
}
