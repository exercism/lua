return {
  module_name = 'ArmstrongNumbers',

  generate_test = function(case)
    local template = [[
      assert.is_%s(ArmstrongNumbers.is_armstrong_number(%d))]]
    return template:format(case.expected, case.input.number)
  end
}
