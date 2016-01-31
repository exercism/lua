local School = {}

function School:new()
  self.__index = self
  return setmetatable({ db = {} }, self)
end

function School:roster()
  return self.db
end

function School:add(name, grade)
  if self.db[grade] then
    table.insert(self.db[grade], name)
    table.sort(self.db[grade])
  else
    self.db[grade] = { name }
  end
end

function School:grade(grade)
  if self.db[grade] then
    return self.db[grade]
  end
  return {}
end

return School
