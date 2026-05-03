return {
  module_name = 'SpaceAge',

  generate_test = function(case)
    require'pl.pretty'.dump(case)

    if type(case.expected) == 'table' then
      local template = [[
      local age = SpaceAge:new(%s)
      assert.has_error(function() age.on_%s() end, '%s')]]

      return template:format(tostring(case.input.seconds), case.input.planet:lower(), case.expected.error)
    else
      local template = [[
        local age = SpaceAge:new(%s)
        assert.are.equal(%s, age.on_%s())]]

      return template:format(tostring(case.input.seconds), case.expected, case.input.planet:lower())
    end
  end
}
