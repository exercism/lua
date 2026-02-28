return {
  module_name = 'acronym',

  generate_test = function(case)
    local template = [[
      local input = "%s"
      local expected = '%s'
      assert.equal(expected, acronym(input))]]
    return template:format(case.input.phrase, case.expected)
  end
}
