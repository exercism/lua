return {
  module_name = 'roman_numerals',

  generate_test = function(case)
    local template = [[
      assert.are.equal('%s', roman_numerals.to_roman(%s))]]
    return template:format(case.expected, case.input.number)
  end
}
