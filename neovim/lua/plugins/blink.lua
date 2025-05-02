-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "v1.1.1",
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
