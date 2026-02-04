-- Autoformat
return {
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		event = "BufWritePre",
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't have
				-- a well standardized coding style. You can add additional languages
				-- here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2", "-bn", "-ci", "-sr" },
				},
				stylua = {
					prepend_args = {
						"--column-width",
						88,
						"--quote-style",
						"AutoPreferDouble",
					},
				},
				yamlfmt = {
					prepend_args = {
						"-formatter",
						"include_document_start=true",
						"-formatter",
						"retain_line_breaks_single=true",
						"-formatter",
						"max_line_length=80",
						"-formatter",
						"scan_folded_as_literal=true",
						"-formatter",
						"pad_line_comments=2",
						"-formatter",
						"trim_trailing_whitespace=true",
					},
				},
			},
			formatters_by_ft = {
				["_"] = { "trim_whitespace", "trim_newlines" },
				elm = { "elm_format" },
				gleam = { "gleam" },
				go = { "gofumpt", "gofmt", stop_after_first = true },
				javascript = { "deno_fmt" },
				json = { "jq" },
				lua = { "stylua" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" },
				yaml = { "yamlfmt", "yq", stop_after_first = true },
			},
		},
		version = "*",
	},
}
