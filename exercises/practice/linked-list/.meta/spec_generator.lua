return {
  module_name = 'LinkedList',

  generate_test = function(case)
    local lines = { 'local list = LinkedList()' }

    for _, operation in ipairs(case.input.operations) do
      if operation.value then
        table.insert(lines, ('list:%s(%s)'):format(operation.operation, operation.value))
      elseif operation.expected then
        table.insert(lines, ('assert.equal(%s, list:%s())'):format(operation.expected, operation.operation))
      else
        table.insert(lines, ('list:%s()'):format(operation.operation))
      end
    end

    return table.concat(lines, '\n')
  end
}
