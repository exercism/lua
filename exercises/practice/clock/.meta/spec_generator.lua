local utils = require 'utils'

local function clock_at(clock)
  return ('clock.at(%d, %d)'):format(clock.hour, clock.minute)
end

return {
  module_name = 'clock',

  generate_test = function(case)
    if case.property == 'create' then
      local template = [[
        assert.are.equal(%s, tostring(%s))]]
      return template:format(utils.stringify(case.expected), clock_at(case.input))
    elseif case.property == 'add' then
      local template = [[
        assert.are.equal(%s, tostring(%s:plus(%d)))]]
      return template:format(utils.stringify(case.expected), clock_at(case.input), case.input.value)
    elseif case.property == 'subtract' then
      local template = [[
        assert.are.equal(%s, tostring(%s:minus(%d)))]]
      return template:format(utils.stringify(case.expected), clock_at(case.input), case.input.value)
    end

    local template = [[
      local clock1 = %s
      local clock2 = %s
      assert.is_%s(clock1:equals(clock2))]]
    return template:format(clock_at(case.input.clock1), clock_at(case.input.clock2), case.expected)
  end
}
