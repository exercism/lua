local function Scores(self)
  return self.scores
end

local function Latest(self)
  return self.scores[#self.scores]
end

local function PersonalBest(self)
  return math.max(table.unpack(self.scores))
end

local function PersonalTopThree(self)
  local values = {table.unpack(self.scores)}
  table.sort(
      values,
      function(a, b)
          return a > b
      end
  )
  local stop = math.min(3, #values)
  return {table.unpack(values, 1, stop)}
end

return function(scores)
  return {
    scores = table.unpack(scores),
    Scores = Scores,
    Latest = Latest,
    PersonalBest = PersonalBest,
    PersonalTopThree = PersonalTopThree
  }
end
