local function expect_error(action, message)
  local template = [[
    assert.has_error(function()
      %s
    end, '%s')]]
  return template:format(action, message)
end

local function render_operation(operation)
  if operation.operation == 'clear' then
    return 'buffer:clear()'
  end

  if operation.operation == 'overwrite' then
    return ('buffer:forceWrite(%d)'):format(operation.item)
  end

  if operation.operation == 'write' then
    local write = ('buffer:write(%d)'):format(operation.item)
    return operation.should_succeed and write or expect_error(write, 'buffer is full')
  end

  if operation.should_succeed then
    return ('assert.are.equal(%d, buffer:read())'):format(operation.expected)
  end
  return expect_error('buffer:read()', 'buffer is empty')
end

return {
  module_name = 'CircularBuffer',

  generate_test = function(case)
    local lines = { ('local buffer = CircularBuffer:new(%d)'):format(case.input.capacity) }
    for _, operation in ipairs(case.input.operations) do
      table.insert(lines, render_operation(operation))
    end
    return table.concat(lines, '\n')
  end
}
