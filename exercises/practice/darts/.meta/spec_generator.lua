return {
  module_name = 'Darts',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, Darts.%s(%s, %s))]]
    return template:format(case.expected, case.property, case.input.x, case.input.y)
  end
}
