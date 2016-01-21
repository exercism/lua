local Robot = {}

function buildName()
  return string.char(math.random(65,90))..string.char(math.random(65,90))..math.random(100,999)
end

function nameExists(names,name)
  if (names.length ~=nil) then
    for i = 1, #names do
      if names[i] == name then
        return true
      end  
    end
  end
  return false    
end  

function Robot:new()
  self.__index = self
  local names = {}
  local name = buildName()
  if (nameExists(names, name)) then
    name = buildName()
  end
  names[#names] = name
  return setmetatable({ name = name, names = names }, self)
end

function Robot:reset()
  local name  = buildName()
  local names = self.names
  if (nameExists(names, name)) then
    name = buildName()
  end
  names[#names] = name
  self.names = names
  self.name = name
end  

return Robot
