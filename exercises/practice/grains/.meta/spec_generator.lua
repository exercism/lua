return {
  module_name = 'grains',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function() grains.%s(%s) end, '%s')]]

      return template:format(case.property, case.input and case.input.square or '', case.expected.error)
    else
      local template = [[
        assert.are.equal(%s, grains.%s(%s))]]

      return template:format(tostring(case.expected), case.property, case.input and case.input.square or '')
    end
  end
}
