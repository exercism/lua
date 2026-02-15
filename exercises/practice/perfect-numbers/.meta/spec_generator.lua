return {
  module_name = 'perfect_numbers',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
      assert.has_error(function() perfect_numbers.classify(%s) end)]]
      return template:format(case.input.number)
    else
      local template = [[
        assert.equal('%s', perfect_numbers.classify(%s))]]
      return template:format(case.expected, case.input.number)
    end
  end
}
