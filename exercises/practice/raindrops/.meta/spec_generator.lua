return {
  module_name = 'raindrops',

  generate_test = function(case)
    local template = [[
      assert.equal('%s', raindrops(%d))]]
    return template:format(case.expected, case.input.number)
  end
}
