local PhoneNumber = {}

function PhoneNumber:new(string_or_number)
  self.__index = self
  local n = string.gsub(string_or_number, '%D', '')
  n = n:match'^1?(%d%d%d%d%d%d%d%d%d%d)$' or '0000000000'
  return setmetatable({ number = n }, self)
end

function PhoneNumber:areaCode(symbol)
  return self.number:sub(1, 3)
end

function PhoneNumber:__tostring()
  local phone_format = '(%d) %d-%d'
  local area_code, central_office_code, station_number = self:areaCode(), self.number:sub(4, 6), self.number:sub(7, 10)
  return phone_format:format(area_code, central_office_code, station_number)
end

return PhoneNumber
