-- Autocompletion
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	opts_extend = { "sources.default" },
	version = "v1.0.0",
	opts = {
		keymap = {
			preset = "default",
			["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
		},
		completion = {
			trigger = {
				show_on_keyword = false,
				show_on_trigger_character = false,
			},
		},
		cmdline = {
			enabled = false,
		},
	},
}
