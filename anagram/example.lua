local Anagram = {}

function Anagram:new(a_word)
  self.__index = self
  return setmetatable({word = a_word:lower()}, self)
end

local function alphagram(a_word)
  local str = a_word
  local t = {}
  for i = 1,#str do
    t[i] = str:sub(i, i)      -- string library sets metatable so can be accessed in object oriented style 
  end
  table.sort(t)               -- sorts in place, no return value
  return table.concat(t,'')
end  
 
function Anagram:match( list )
  local result = {}
  local t = list
  for i =1,#t do
    if (t[i]:lower() == self.word) then 
      table.insert(result, t[i])    
    elseif (alphagram(t[i]:lower()) == alphagram(self.word) ) then
      table.insert(result, t[i])
    end  
  end
  return result
end

return Anagram