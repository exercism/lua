local function render_operation(operation)
  if operation.amount then
    return 'account:' .. operation.operation .. '(' .. operation.amount .. ')'
  else
    return 'account:' .. operation.operation .. '()'
  end
end

return {
  module_name = 'BankAccount',

  generate_test = function(case)
    local lines = { 'local account = BankAccount:new()' }

    for i, operation in ipairs(case.input.operations) do
      if i == #case.input.operations then
        if type(case.expected) == 'table' and case.expected.error then
          table.insert(lines, 'assert.has_error(function() ' .. render_operation(operation) .. ' end)')
        else
          table.insert(lines, 'assert.equal(' .. case.expected .. ', ' .. render_operation(operation) .. ')')
        end
      else
        table.insert(lines, render_operation(operation))
      end
    end

    return table.concat(lines, '\n')
  end
}
