return {
  module_name = 'atbash_cipher',

  generate_test = function(case)
    local lines = {}
    table.insert(lines, string.format("local phrase = '%s'", case.input.phrase))
    table.insert(lines, string.format("local expected = '%s'", case.expected))
    table.insert(lines, string.format("local result = atbash_cipher.%s(phrase)", case.property))
    table.insert(lines, "assert.are.same(expected, result)")

    return table.concat(lines, "\n")
  end
}
