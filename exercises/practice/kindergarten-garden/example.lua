local student_offsets = {
  alice = 0,
  bob = 1,
  charlie = 2,
  david = 3,
  eve = 4,
  fred = 5,
  ginny = 6,
  harriet = 7,
  ileana = 8,
  joseph = 9,
  kincaid = 10,
  larry = 11
}

local plant_abbreviations = { g = 'grass', c = 'clover', r = 'radishes', v = 'violets' }

local function plant_string_for_student(garden, student)
  if not student_offsets[student] then return '' end
  local _, _, row1, row2 = garden:find('(%w+)\n(%w+)')
  local i = 2 * (student_offsets[student]) + 1
  return row1:sub(i, i + 1) .. row2:sub(i, i + 1)
end

return function(s)
  s = s:lower()

  return setmetatable({}, {
    __index = function(_, student)
      local result = {}
      plant_string_for_student(s, student:lower()):gsub('.', function(c)
        table.insert(result, plant_abbreviations[c])
      end)
      return result
    end
  })
end
