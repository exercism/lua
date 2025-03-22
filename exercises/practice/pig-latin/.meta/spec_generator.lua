return {
  module_name = 'translate',

  generate_test = function(case)
    local template = [[
      assert.equal('%s', translate('%s'))]]
    return template:format(case.expected, case.input.phrase)
  end
}
