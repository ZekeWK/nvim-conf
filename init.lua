package.path = package.path .. ";/home/wk/code/proj/nvim/lua/?.lua"
for _, source in ipairs{
	'opts',
	'packer-conf',
 	'lsp-conf',
	'cmp-conf',
	'treesitter-conf',
	'luasnip-conf',
} do
	local ok, val = pcall(require, source)
	if ok then else vim.api.nvim_err_writeln('Error at: ' .. source) end
end
