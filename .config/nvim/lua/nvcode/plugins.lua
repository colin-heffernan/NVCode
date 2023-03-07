local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- Start
	use { "wbthomason/packer.nvim" }
	--[[ use { "lewis6991/impatient.nvim" } ]]
	use { "nvim-lua/plenary.nvim" }
	use { "MunifTanjim/nui.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "rcarriga/nvim-notify" }
	--[[ use { "anuvyklack/hydra.nvim" } ]]
	use { "kyazdani42/nvim-web-devicons" }
	use { "folke/tokyonight.nvim" }
	use { "nvim-lualine/lualine.nvim" }
	use { "akinsho/bufferline.nvim" }
	--[[ use { "noib3/nvim-cokeline" } ]]
	use { "goolord/alpha-nvim" }
	use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" }
	use { "nvim-telescope/telescope.nvim" }
	--[[ use { "ahmedkhalf/project.nvim" } ]]
	use { "nvim-treesitter/nvim-treesitter" }
	--[[ use { "nvim-treesitter/nvim-treesitter-textobjects" } ]]
	use { "windwp/nvim-ts-autotag" }
	use { "JoosepAlviste/nvim-ts-context-commentstring" }
	use { "uga-rosa/ccc.nvim" }
	use { "akinsho/toggleterm.nvim" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-cmdline" }
	use { "folke/noice.nvim" }

	-- Opt
	use { "neovim/nvim-lspconfig", event = { "BufRead", "BufNewFile" } }
	--[[ use { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig" } ]]
	use { "b0o/SchemaStore.nvim", after = "nvim-lspconfig", config = function() require("nvcode.lsp") end }
	--[[ use { "folke/trouble.nvim", after = "SchemaStore.nvim", config = function() require("nvcode.trouble") end } ]]
	--[[ use { "glepnir/lspsaga.nvim", after = "trouble.nvim", config = function() require("nvcode.lspsaga") end } ]]
	--[[ use { "mfussenegger/nvim-dap", event = { "BufRead", "BufNewFile" } } ]]
	--[[ use { "rcarriga/nvim-dap-ui", after = "nvim-dap", config = function() require("nvcode.dap") end } ]]
	use { "lukas-reineke/indent-blankline.nvim", event = { "BufRead", "BufNewFile" }, config = function() require("nvcode.indentblankline") end }
	use { "lewis6991/gitsigns.nvim", event = { "BufRead", "BufNewFile" }, config = function() require("nvcode.gitsigns") end }
	use { "nvim-neorg/neorg", event = { "BufRead", "BufNewFile" }, config = function() require("nvcode.neorg") end }
	use { "numToStr/Comment.nvim", event = { "BufRead", "BufNewFile" }, config = function() require("nvcode.comment") end }
	--[[ use { "folke/twilight.nvim", after = "zen-mode.nvim", config = function() require("nvcode.zen") end } ]]
	--[[ use { "folke/zen-mode.nvim", event = { "BufRead", "BufNewFile" } } ]]
	use { "ggandor/leap.nvim", event = { "BufRead", "BufNewFile" } }
	use { "ggandor/leap-spooky.nvim", after = "leap.nvim", config = function() require("nvcode.leap") end }
	use { "windwp/nvim-autopairs", event = "InsertEnter", config = function() require("nvcode.autopairs") end }
	use { "folke/todo-comments.nvim", event = { "BufRead", "BufNewFile" }, config = function() require("nvcode.todo") end }
	--[[ use { "hrsh7th/cmp-calc", event = { "BufRead", "BufNewFile" } } ]]
	use { "hrsh7th/cmp-nvim-lsp", event = { "BufRead", "BufNewFile" } }
	use { "saadparwaiz1/cmp_luasnip", after = "cmp-nvim-lsp" }
	use { "L3MON4D3/LuaSnip", after = "cmp-nvim-lsp" }
	use { "rafamadriz/friendly-snippets", after = "LuaSnip", config = function() require("nvcode.cmp.lazy") end }

	-- Non-NixOS Exclusive
	use { "williamboman/mason.nvim" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
