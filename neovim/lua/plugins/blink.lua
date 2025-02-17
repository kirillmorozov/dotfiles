-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "v0.12.4",
	opts_extend = { "sources.default" },
	opts = {
		keymap = {
			preset = "default",
		},
		cmdline = {
			sources = {},
		},
		sources = {
			default = { "buffer", "lsp", "snippets", "path" },
		},
	},
}
