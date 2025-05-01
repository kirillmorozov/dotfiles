-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim" },
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details Load luvit types
						-- when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		event = { "BufNew", "BufRead" },
		config = function()
			-- This function gets run when an LSP attaches to a particular buffer.
			-- That is to say, every time a new file is opened that is associated
			-- with an lsp (for example, opening `main.rs` is associated with
			-- `rust_analyzer`) this function will be executed to configure the
			-- current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup(
					"kickstart-lsp-attach",
					{ clear = true }
				),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set(
							"n",
							keys,
							func,
							{ buffer = event.buf, desc = "LSP: " .. desc }
						)
					end
					map("<leader>r", vim.lsp.buf.rename, "Rename all references")
					map("<leader>a", vim.lsp.buf.code_action, "Select a code action")
					-- The following two autocommands are used to highlight references of
					-- the word under your cursor when your cursor rests there for a
					-- little while. See `:help CursorHold` for information about when
					-- this is executed When you move your cursor, the highlights will be
					-- cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client.server_capabilities.documentHighlightProvider
					then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
			local servers = {
				bashls = {},
				clangd = {},
				denols = {},
				gleam = {},
				gopls = {},
				lua_ls = {
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if
							vim.loop.fs_stat(path .. "/.luarc.json")
							or vim.loop.fs_stat(path .. "/.luarc.jsonc")
						then
							return
						end
						client.config.settings.Lua =
							vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = { version = "LuaJIT" },
								workspace = {
									checkThirdParty = false,
									library = { vim.env.VIMRUNTIME },
								},
							})
					end,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
				pylsp = {},
				ruff = {},
				terraformls = {},
				yamlls = {
					settings = {
						yaml = {
							schemas = {
								["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.{yml,yaml}",
								["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
								["https://json.schemastore.org/github-action"] = ".github/actions/*/action.{yml,yaml}",
								["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
								["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
							},
						},
					},
				},
			}
			for server, opts in pairs(servers) do
				require("lspconfig")[server].setup(opts)
			end
		end,
	},
}
