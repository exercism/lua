return {
  module_name = 'sublist',

  generate_test = function(case)
    local template = [[
      assert.equal('%s', %s({ %s }, { %s }))]]
    return template:format(case.expected, case.property, table.concat(case.input.listOne, ', '),
                           table.concat(case.input.listTwo, ', '))
  end
}
