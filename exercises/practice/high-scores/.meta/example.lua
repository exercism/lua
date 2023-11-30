local function scores(self)
  return self.values
end

local function latest(self)
  return self.values[#self.values]
end

local function personal_best(self)
  return math.max(table.unpack(self.values))
end

local function personal_top_three(self)
  local values = { table.unpack(self.values) }
  table.sort(values, function(a, b)
    return a > b
  end)
  local stop = math.min(3, #values)
  return { table.unpack(values, 1, stop) }
end

return function(values)
  return {
    values = values,
    scores = scores,
    latest = latest,
    personal_best = personal_best,
    personal_top_three = personal_top_three
  }
end
