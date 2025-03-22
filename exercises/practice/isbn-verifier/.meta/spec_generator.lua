return {
  module_name = 'isbn_verifier',

  generate_test = function(case)
    local template = [[
      assert.is_%s(isbn_verifier.valid('%s'))]]
    return template:format(case.expected, case.input.isbn)
  end
}
