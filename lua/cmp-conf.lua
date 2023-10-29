-- Set up nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
 
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
--	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  	['<Tab>'] = function(fallback)
  		if cmp.visible() then
  			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>u', true, false, true), 'n', true)
  			cmp.confirm { select = true }
  		else
  			fallback()
  		end
  	end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['½'] = function()
			if luasnip.jumpable() then luasnip.jump(-1) end
		end,
		['§'] = function()
			if luasnip.jumpable() then luasnip.jump(1) end
		end
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip', max_item_count = 3 }, -- For luasnip users.

		{ name = 'nvim_lsp', max_item_count = 3},
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, 
	{
		{ name = 'buffer', max_item_count = 3, keyword_length = 2 },
		{ name = 'path', max_item_count = 3, keyword_length = 2},
	}),
-- 	source_priority = {
-- 		nvim_lsp = 1000,
--  		luasnip = 750,
-- 		buffer = 500,
-- 		path = 250,
-- },
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--	 sources = cmp.config.sources({
--		 { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--	 }, {
--		 { name = 'buffer' },
--	 })
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
     	 { name = 'buffer', keyword_length = 2 }
      }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
     	 { name = 'path', keyword_length = 2 }
      }, {
     	 { name = 'cmdline', keyword_length = 2 }
      })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')[].setup {
-- 	capabilities = capabilities
-- }
