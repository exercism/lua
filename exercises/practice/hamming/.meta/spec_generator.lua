return {
  module_name = 'hamming',

  generate_test = function(case)
    if type(case.expected) == 'number' then
      local template = [[
        assert.are.equal(%s, hamming.compute("%s", "%s"))]]
      return template:format(case.expected, case.input.strand1, case.input.strand2)
    else
      local template = [[
        assert.has_error(function()
          hamming.compute("%s", "%s")
        end, "%s")]]
      return template:format(case.input.strand1, case.input.strand2, case.expected.error)
    end
  end
}
