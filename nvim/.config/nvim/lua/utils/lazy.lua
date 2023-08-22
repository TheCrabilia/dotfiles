local M = {}

M.has = function(plugin)
	return require("lazy.core.config").plugins[plugin] ~= nil
end

M.get = function(plugin)
	return require("lazy.core.config").plugins[plugin]
end

return M
