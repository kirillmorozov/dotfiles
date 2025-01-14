-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "v0.10.0",
	opts_extend = { "sources.default" },
	opts = {
		keymap = {
			preset = "default",
		},
		sources = {
			default = { "buffer", "lsp", "snippets", "path" },
		},
	},
}
