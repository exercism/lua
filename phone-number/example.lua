local PhoneNumber = {}

function PhoneNumber:new(no_as_string)
  self.__index = self
  local n = "0000000000"
  n = no_as_string:gsub("[^0-9]", "")
  if (n:len() == 11 and n:sub(1, 1) == "1") then 
    n = n:sub(2, 11)
  else 
    if (n:len() > 10 or n:len() < 10) then
      n = "0000000000"
    end
  end
  return setmetatable({ number = n }, self)
end

function PhoneNumber:areaCode(symbol)
  return self.number:sub(1, 3)
end

function PhoneNumber:toString(symbol)
  return "("..self.number:sub(1, 3)..") "..self.number:sub(4, 6).."-"..self.number:sub(7, 10)
end

return PhoneNumber
