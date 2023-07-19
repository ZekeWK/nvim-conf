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

	-- Latex
	use 'lervag/vimtex'

	-- Rust
	use 'simrat39/rust-tools.nvim'
	use {
    'cameron-wags/rainbow_csv.nvim',
    config = function()
        require 'rainbow_csv'.setup()
    end,
    -- optional lazy-loading below
    module = {
        'rainbow_csv',
        'rainbow_csv.fns'
    },
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    }
}
end)
