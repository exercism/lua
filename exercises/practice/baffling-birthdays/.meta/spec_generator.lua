local utils = require 'utils'

return {
  module_name = 'baffling_birthdays',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      if case.expected.years and case.expected.years.leapYear ~= nil then
        return [[
          local birthdates = baffling_birthdays.random_birthdates(1000)
          for _, birthdate in ipairs(birthdates) do
            local year = tonumber(birthdate:sub(1, 4))
            assert.is_false(year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0))
          end]]
      elseif case.expected.months and case.expected.months.random ~= nil then
        return [[
          local birthdates = baffling_birthdays.random_birthdates(1000)
          local seen = {}
          local unique_count = 0
          for _, birthdate in ipairs(birthdates) do
            local month = tonumber(birthdate:sub(6, 7))
            if not seen[month] then
              seen[month] = true
              unique_count = unique_count + 1
            end
          end
          assert.are.equal(12, unique_count)]]
      elseif case.expected.days and case.expected.days.random ~= nil then
        return [[
          local birthdates = baffling_birthdays.random_birthdates(1000)
          local seen = {}
          local unique_count = 0
          for _, birthdate in ipairs(birthdates) do
            local day = tonumber(birthdate:sub(9, 10))
            if not seen[day] then
              seen[day] = true
              unique_count = unique_count + 1
            end
          end
          assert.are.equal(31, unique_count)]]
      else
        error('Unhandled case')
      end
    elseif case.expected == 'length == groupsize' then
      return [[
        for i = 1, 10 do
          assert.are.equal(i, #baffling_birthdays.random_birthdates(i))
        end]]
    elseif case.property == 'estimatedProbabilityOfSharedBirthday' then
      local template = [[
        local actual = baffling_birthdays.%s(%s)
        assert.are.near(%s, actual, 1)]]

      return template:format(utils.snake_case(case.property), case.input.groupSize, case.expected)
    else
      local template = [[
        local actual = baffling_birthdays.%s(%s)
        assert.are.equal(%s, actual)]]

      local input = '{ ' .. table.concat(utils.map(case.input.birthdates, utils.stringify), ', ') .. ' }'
      return template:format(utils.snake_case(case.property), input, case.expected)
    end
  end
}
