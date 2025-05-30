return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		".git",
		".ruff.toml",
		"pyproject.toml",
		"ruff.toml",
	},
}
