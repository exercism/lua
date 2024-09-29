local function render_factors(factors)
  local rendered = {}
  for _, factor in ipairs(factors) do
    table.insert(rendered, string.format('{ %d, %d }', factor[1], factor[2]))
  end
  return '{ ' .. table.concat(rendered, ', ') .. ' }'
end

return {
  module_name = 'palindrome_products',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          palindrome_products.%s(%d, %d)
        end, '%s')]]

      return template:format(case.property, case.input.min, case.input.max, case.expected.error)
    else
      local template = [[
        local expected = {
          value = %s, --
          factors = %s
        }
        assert.are.same(expected, palindrome_products.%s(%d, %d))]]

      return template:format(case.expected.value or 'nil', render_factors(case.expected.factors), case.property,
                             case.input.min, case.input.max)
    end
  end
}
