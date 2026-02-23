return {
  module_name = 'prism',

  generate_test = function(case)
    local lines = {}
    table.insert(lines,
                 string.format("local start = { x = %s, y = %s, angle = %s }", case.input.start.x, case.input.start.y,
                               case.input.start.angle))

    if #case.input.prisms == 0 then
      table.insert(lines, "local prisms = {}")
    else
      table.insert(lines, "local prisms = {")
      for _, prism in ipairs(case.input.prisms) do
        table.insert(lines, string.format("  { id = %s, x = %s, y = %s, angle = %s },", prism.id, prism.x, prism.y,
                                          prism.angle))
      end
      table.insert(lines, "}")
    end

    local expected = ""
    if #case.expected.sequence == 0 then
      expected = "{}"
    else
      expected = string.format("{ %s }", table.concat(case.expected.sequence, ", "))
    end

    table.insert(lines, string.format("local expected = %s", expected))
    table.insert(lines, string.format("local result = prism.%s(start, prisms)", case.property))
    table.insert(lines, "assert.are.same(expected, result)")

    return table.concat(lines, "\n")
  end
}
