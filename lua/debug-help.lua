local function dump_rec(o, d)
	local indent = string.rep("  ", d)
   if type(o) == 'table' then
      local s = indent .. '{\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. indent .. " " .. '['..k..'] = \n' .. dump_rec(v, d+2) .. ',\n'
      end
      return s .. indent .. '}\n'
   else
      return indent .. tostring(o)
   end
end

function Dump_Long(o)
	return dump_rec(o, 0)
end

function Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- vim.api.nvim_err_writeln(Dump(cmp));

function print(s)
	vim.api.nvim_err_writeln(s);
end
