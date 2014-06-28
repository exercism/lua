local Words = {}

function Words:new(phrase)
  self.__index = self
  return setmetatable({phrase = phrase:lower()}, self)
end

 
function Words:count()
  local iter = string.gmatch(self.phrase, "%w+")
  local result = {}
  for element in iter do
    if result[element] == nil then
      result[element] = "1"
    else
      local new_count = tonumber(result[element]) + 1
      result[element] = tostring(new_count)  
    end  
  end
  return result
end

return Words