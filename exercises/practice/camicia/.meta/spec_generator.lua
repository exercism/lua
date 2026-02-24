return {
  module_name = 'camicia',

  generate_test = function(case)
    local lines = {}
    local function string_array(arr)
      if #arr == 0 then
        return "{}"
      end
      local formatted = {}
      for _, v in ipairs(arr) do
        table.insert(formatted, string.format("'%s'", v))
      end
      return string.format("{ %s }", table.concat(formatted, ", "))
    end

    table.insert(lines, string.format("local playerA = %s", string_array(case.input.playerA)))
    table.insert(lines, string.format("local playerB = %s", string_array(case.input.playerB)))

    local expected = string.format("{ status = '%s', tricks = %d, cards = %d }", case.expected.status,
                                   case.expected.tricks, case.expected.cards)

    table.insert(lines, string.format("local expected = %s", expected))
    table.insert(lines, string.format("local result = camicia.%s(playerA, playerB)", case.property))
    table.insert(lines, "assert.are.same(expected, result)")

    return table.concat(lines, "\n")
  end
}
