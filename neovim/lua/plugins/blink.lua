-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "v0.13.1",
	opts_extend = { "sources.default" },
	opts = {
		keymap = {
			preset = "default",
		},
		cmdline = {
			enabled = false,
		},
		sources = {
			default = { "buffer", "lsp", "path", "snippets" },
		},
	},
}
