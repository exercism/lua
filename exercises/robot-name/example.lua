local Robot = {}

function build_name()
  return string.char(math.random(65,90))..string.char(math.random(65,90))..math.random(100,999)
end

function name_exists(names,name)
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
  local name = build_name()
  if (name_exists(names, name)) then
    name = build_name()
  end
  names[#names] = name
  return setmetatable({ name = name, names = names }, self)
end

function Robot:reset()
  local name  = build_name()
  local names = self.names
  if (name_exists(names, name)) then
    name = build_name()
  end
  names[#names] = name
  self.names = names
  self.name = name
end

return Robot
