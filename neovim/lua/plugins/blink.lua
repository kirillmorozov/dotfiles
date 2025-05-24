-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	opts_extend = { "sources.default" },
	version = "*",
	opts = {
		cmdline = { enabled = false },
		keymap = {
			preset = "default",
			["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
		},
	},
}
