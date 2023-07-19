
require("luasnip").setup({
	store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_vscode") .load({ paths = { "./lua/snippets" } })
