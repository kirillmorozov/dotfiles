-- Collection of various small independent plugins/modules
return {
	{
		"echasnovski/mini.nvim",
		-- NOTE(kirillmorozov): opts is a table that holds config options for mini
		-- modules.
		opts = {
			comment = {
				mappings = {
					comment_line = "<C-c>",
					comment_visual = "<C-c>",
				},
			},
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			surround = {},
			-- Simple and easy statusline. You could remove this setup call if you
			-- don't like it, and try some other statusline plugin
			statusline = { use_icons = true },
		},
		config = function(_, opts)
			for plugin, options in pairs(opts) do
				require("mini." .. plugin).setup(options)
			end
		end,
	},
}
