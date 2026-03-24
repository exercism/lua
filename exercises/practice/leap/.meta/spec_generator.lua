return {
  module_name = 'is_leap_year',

  generate_test = function(case)
    local template = [[
      assert.is_%s(is_leap_year(%d))]]
    return template:format(case.expected, case.input.year)
  end
}
