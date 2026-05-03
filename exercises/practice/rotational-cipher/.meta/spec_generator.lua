return {
  module_name = 'rotational_cipher',

  generate_test = function(case)
    local template = [[
      assert.are.equal("%s", rotational_cipher.%s("%s", %s))]]

    return template:format(tostring(case.expected), case.property, case.input.text, case.input.shiftKey)
  end
}
