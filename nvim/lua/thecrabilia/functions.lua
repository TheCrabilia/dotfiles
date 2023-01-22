local M = {}

function M.has_value(tab, val)
  for value in pairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

return M
