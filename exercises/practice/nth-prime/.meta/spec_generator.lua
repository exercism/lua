return {
  module_name = 'nth',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function()
          nth(%d)
        end)]]
      return template:format(case.input.number)
    end

    return ('assert.equal(%d, nth(%d))'):format(case.expected, case.input.number)
  end
}
