local School = {}

function School:new()
  self.__index = self
  return setmetatable({ db = {} }, self)
end

function School:roster()
  local grades = {}
  for grade, _ in pairs(self.db) do
    table.insert(grades, grade)
  end
  table.sort(grades)

  local roster = {}
  for _, grade in ipairs(grades) do
    for _, student in ipairs(self.db[grade]) do
      table.insert(roster, student)
    end
  end
  return roster
end

function School:add(name, grade)
  for _, grade in pairs(self.db) do
    for _, student in ipairs(grade) do
      if student == name then
        return false
      end
    end
  end

  if self.db[grade] then
    table.insert(self.db[grade], name)
    table.sort(self.db[grade])
  else
    self.db[grade] = { name }
  end

  return true
end

function School:grade(grade)
  return self.db[grade] or {}
end

return School
