local function render_numbers(numbers)
  return table.concat(numbers, ', ')
end

return {
  module_name = 'prime_factors',

  generate_test = function(case)
    local template = [[
      assert.are.same({ %s }, prime_factors(%s))]]
    return template:format(render_numbers(case.expected), case.input.value)
  end
}
