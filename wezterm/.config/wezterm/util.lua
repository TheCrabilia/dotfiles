local M = {}

function M.filter(list, fun)
	local filtered = {}
	for _, v in ipairs(list) do
		if fun(v) then
			table.insert(filtered, v)
		end
	end
	return filtered
end

return M
