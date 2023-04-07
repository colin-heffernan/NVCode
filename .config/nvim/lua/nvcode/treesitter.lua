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
		"dockerfile",
		"gitignore",
		"graphql",
		"haskell",
		"html",
		"javascript",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"nix",
		"norg",
		"python",
		"regex",
		"rust",
		"scss",
		"svelte",
		"toml",
		"typescript",
		"vim",
		"yuck"
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
	}
}
