local Set = {}
Set.__index = Set

local function create(...)
  local o = { _contents = {} }
  for _, v in ipairs(table.pack(...)) do
    o._contents[v] = true
  end
  return setmetatable(o, Set)
end

function Set:equals(other)
  return self:is_subset(other) and other:is_subset(self)
end

function Set:add(element)
  self._contents[element] = true
end

function Set:remove(element)
  self._contents[element] = nil
end

function Set:is_empty()
  return self:equals(create())
end

function Set:contains(element)
  return self._contents[element] ~= nil
end

function Set:is_subset(other)
  for k in pairs(self._contents) do
    if not other:contains(k) then return false end
  end
  return true
end

function Set:is_disjoint(other)
  for k in pairs(self._contents) do
    if other:contains(k) then return false end
  end
  for k in pairs(other._contents) do
    if self:contains(k) then return false end
  end
  return true
end

function Set:intersection(other)
  local intersection = create()
  for k in pairs(self._contents) do
    if other:contains(k) then intersection:add(k) end
  end
  return intersection
end

function Set:union(other)
  local union = create()
  for k in pairs(self._contents) do
    union:add(k)
  end
  for k in pairs(other._contents) do
    union:add(k)
  end
  return union
end

function Set:difference(other)
  local difference = self:union(create())
  for k in pairs(other._contents) do
    difference:remove(k)
  end
  return difference
end

return create
