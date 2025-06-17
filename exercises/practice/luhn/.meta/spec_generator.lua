return {
  module_name = 'luhn',

  generate_test = function(case)
    local template = [[
      assert.is_%s(luhn.valid('%s'))]]
    return template:format(case.expected, case.input.value)
  end
}
