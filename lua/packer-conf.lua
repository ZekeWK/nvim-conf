vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Required
	use 'wbthomason/packer.nvim'


	-- Autocompletion
	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})
	use 'saadparwaiz1/cmp_luasnip'

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

end)
