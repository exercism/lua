return {
  module_name = 'phone_number',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          phone_number.clean('%s')
        end)]]

      return template:format(case.input.phrase)
    else
      local template = [[
        assert.are.equal('%s', phone_number.clean('%s'))]]

      return template:format(case.expected, case.input.phrase)
    end
  end
}
