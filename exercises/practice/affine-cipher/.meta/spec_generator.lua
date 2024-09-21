return {
  module_name = 'affine_cipher',

  generate_test = function(case)
    if type(case.expected) == 'string' then
      local template = [[
      local phrase = '%s'
      local expected = '%s'
      assert.are.same(expected, affine_cipher.%s(phrase, { a = %d, b = %d }))]]
      return template:format(case.input.phrase, case.expected, case.property, case.input.key.a, case.input.key.b)
    else
      local template = [[
        local phrase = '%s'
        assert.has.error(function()
          affine_cipher.%s(phrase, { a = %d, b = %d })
        end, '%s')]]
      return template:format(case.input.phrase, case.property, case.input.key.a, case.input.key.b, case.expected.error)
    end
  end
}
