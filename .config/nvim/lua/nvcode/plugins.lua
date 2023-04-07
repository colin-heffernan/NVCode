local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nvcode.colorscheme")
		end
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true
	},
	{
		"MunifTanjim/nui.nvim",
		lazy = true
	},
	{
		"nvim-lua/popup.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("nvcode.notify")
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true
	},
	{
		"rebelot/heirline.nvim",
		lazy = false,
		config = function()
			require("nvcode.heirline")
		end
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("nvcode.alpha")
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		lazy = true,
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("nvcode.neotree")
		end
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = true
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring"
		},
		config = function()
			require("nvcode.treesitter")
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		config = function()
			require("nvcode.indentblankline")
		end
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		config = function()
			require("nvcode.todo")
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
			"lukas-reineke/indent-blankline.nvim",
			"folke/todo-comments.nvim"
		},
		config = function()
			require("nvcode.telescope")
		end
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = false,
		config = function()
			require("nvcode.ccc")
		end
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = "ToggleTerm",
		config = function()
			require("nvcode.toggleterm")
		end
	},
	{
		"hrsh7th/cmp-path",
		lazy = true
	},
	{
		"hrsh7th/cmp-buffer",
		lazy = true
	},
	{
		"hrsh7th/cmp-cmdline",
		lazy = true
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline"
		},
		config = function()
			require("nvcode.cmp.auto")
		end
	},
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp"
		},
		config = function()
			require("nvcode.noice")
		end
	},
	{
		"b0o/SchemaStore.nvim",
		lazy = true
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		dependencies = {
			"b0o/SchemaStore.nvim"
		},
		config = function()
			require("nvcode.lsp")
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		config = function()
			require("nvcode.gitsigns")
		end
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		config = function()
			require("nvcode.comment")
		end
	},
	{
		"ggandor/leap-spooky.nvim",
		lazy = true
	},
	{
		"ggandor/leap.nvim",
		lazy = true,
		event = {
			"BufRead",
			"BufNewFile"
		},
		dependencies = {
			"ggandor/leap-spooky.nvim"
		},
		config = function()
			require("nvcode.leap")
		end
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("nvcode.autopairs")
		end
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true
	},
	{
		"saadparwaiz1/cmp_luasnip",
		lazy = true
	},
	{
		"rafamadriz/friendly-snippets",
		lazy = true
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("nvcode.cmp.lazy")
		end
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = "Mason",
		config = function()
			require("nvcode.mason")
		end
	}
})
