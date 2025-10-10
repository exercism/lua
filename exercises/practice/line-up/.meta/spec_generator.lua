return {
  module_name = 'line_up',

  generate_test = function(case)
    local template = [[
    local expected = '%s'
    assert.are.same(expected, line_up.format('%s', %d))]]
    return template:format(case.expected, case.input.name, case.input.number)
  end
}
