-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	enabled = false,
	event = "InsertEnter",
	opts_extend = { "sources.default" },
	version = "v1.1.1",
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
