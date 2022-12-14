local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify "Treesitter not found."
	return
end

configs.setup {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"html",
		"javascript",
		"json",
		"latex",
		"lua",
		"nix",
		"norg",
		"python",
		"regex",
		"rust",
		"svelte",
		"typescript",
		"vim"
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocme = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			},
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "v",
				["@class.outer"] = "v"
			},
			invlude_surrounding_whitespace = true
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer"
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer"
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer"
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer"
			}
		}
	}
}
