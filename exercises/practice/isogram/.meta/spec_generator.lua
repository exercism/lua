return {
  module_name = 'is_isogram',

  generate_test = function(case)
    local template = [[
      assert.is_%s(is_isogram('%s'))]]
    return template:format(case.expected, case.input.phrase)
  end
}
