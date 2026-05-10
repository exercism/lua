local utils = require 'utils'

local function render_expected(expected)
  if type(expected) == 'table' then
    return '{ ' .. table.concat(utils.map(expected, utils.stringify), ', ') .. '}'
  else
    return utils.stringify(expected)
  end
end

return {
  module_name = 'Stopwatch',

  generate_test = function(case)
    local lines = {}

    for _, command in ipairs(case.input.commands) do
      if command.command == 'new' then
        table.insert(lines, 'local stopwatch = Stopwatch:new()')
      elseif command.expected and command.expected.error then
        table.insert(lines,
                     ('assert.has_error(function() stopwatch:%s() end, %s)'):format(utils.snake_case(command.command),
                                                                                    utils.stringify(
                                                                                      command.expected.error)))
      elseif command.by then
        table.insert(lines, ('stopwatch:%s(%s)'):format(utils.snake_case(command.command), render_expected(command.by)))
      elseif command.expected then
        table.insert(lines, ('assert.are.same(%s, stopwatch:%s())'):format(render_expected(command.expected),
                                                                           utils.snake_case(command.command)))
      else
        table.insert(lines, ('stopwatch:%s()'):format(utils.snake_case(command.command)))
      end
    end

    return table.concat(lines, '\n')
  end
}
