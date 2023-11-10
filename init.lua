for _, source in ipairs{
	'debug-help',
	'opts',
	'packer-conf',
 	'lsp-conf',
	'cmp-conf',
	'treesitter-conf',
	'luasnip-conf',
	'vimtex-conf',
	'indent-conf',
} do
	local ok, val = pcall(require, source)
	if ok then else vim.api.nvim_err_writeln('Error at: ' .. source .. '\nwith:\n' .. val) end
end
