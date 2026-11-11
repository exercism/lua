local function render_queen(queen)
  return ('Queen({ row = %d, column = %d })'):format(queen.position.row, queen.position.column)
end

return {
  module_name = 'Queen',

  generate_test = function(case)
    if case.property == 'create' then
      local template = [[
        assert.%s(function()
          %s
        end)]]
      local assertion = type(case.expected) == 'table' and 'has_error' or 'has_no_error'
      return template:format(assertion, render_queen(case.input.queen))
    else
      local template = [[
        local q1 = %s
        local q2 = %s
        assert.is_%s(q1.can_attack(q2))]]
      return template:format(render_queen(case.input.white_queen), render_queen(case.input.black_queen), case.expected)
    end
  end
}
