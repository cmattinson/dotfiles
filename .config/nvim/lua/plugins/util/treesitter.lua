return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "rescript-lang/tree-sitter-rescript" },
	config = function()
		require("nvim-treesitter.install").prefer_git = true

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.moonbit = {
			install_info = {
				url = "https://github.com/moonbitlang/tree-sitter-moonbit",
				branch = "main",
				files = { "src/parser.c", "src/scanner.c" },
				generate_requires_npm = false,
				requires_generate_from_grammar = true,
				use_makefile = true,
			},
			filetype = "moonbit",
		}

		parser_config.rescript = {
			install_info = {
				url = "https://github.com/rescript-lang/tree-sitter-rescript",
				branch = "main",
				files = { "src/parser.c", "src/scanner.c" },
				generate_requires_npm = false,
				requires_generate_from_grammar = true,
				use_makefile = true,
			},
		}

		parser_config.reason = {
			install_info = {
				url = "https://github.com/reasonml-editor/tree-sitter-reason",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "master",
			},
			filetype = "reason",
		}

		parser_config.fsharp = {
			install_info = {
				url = "https://github.com/ionide/tree-sitter-fsharp",
				branch = "main",
				files = { "src/scanner.c", "src/parser.c" },
				location = "fsharp",
			},
			requires_generate_from_grammar = false,
			filetype = "fsharp",
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"go",
				"elixir",
				"javascript",
				"lua",
				"markdown",
				"moonbit",
				"ocaml",
				"python",
				"query",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"zig",
			},
			auto_install = false,

			highlight = { enable = true },
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})

		vim.treesitter.language.add("reason", { filetype = "reason" })
		vim.treesitter.language.add("purescript", { filetype = "purs" })
		vim.treesitter.language.add("moonbit", { filetype = "moonbit" })

		local q = require("vim.treesitter.query")

		local non_filetype_match_injection_language_aliases = {
			ex = "elixir",
			pl = "perl",
			sh = "bash",
			uxn = "uxntal",
			ts = "typescript",
		}

		local function get_parser_from_markdown_info_string(injection_alias)
			local match = vim.filetype.match { filename = "a." .. injection_alias }
			return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
		end

		local function first_node(match, capture_id)
			local nodes = match[capture_id]
			if not nodes or #nodes == 0 then
				return nil
			end
			return nodes[1]
		end

		q.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
			local node = first_node(match, pred[2])
			if not node then
				return
			end
			local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
			if not ok then
				return
			end
			metadata["injection.language"] = get_parser_from_markdown_info_string(text:lower())
		end, { force = true })

		q.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
			local node = first_node(match, pred[2])
			if not node then
				return
			end
			local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
			if not ok then
				return
			end
			local configured = {
				["importmap"] = "json",
				["module"] = "javascript",
				["application/ecmascript"] = "javascript",
				["text/ecmascript"] = "javascript",
			}
			if configured[text] then
				metadata["injection.language"] = configured[text]
			else
				local parts = vim.split(text, "/", {})
				metadata["injection.language"] = parts[#parts]
			end
		end, { force = true })

		q.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
			local id = pred[2]
			local node = first_node(match, id)
			if not node then
				return
			end
			local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr, { metadata = metadata[id] })
			if not ok then
				return
			end
			text = text or ""
			if not metadata[id] then
				metadata[id] = {}
			end
			metadata[id].text = string.lower(text)
		end, { force = true })
	end,
}
