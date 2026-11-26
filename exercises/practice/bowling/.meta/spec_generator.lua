local function render_rolls(rolls)
  if #rolls == 0 then
    return '{}'
  end
  return '{ ' .. table.concat(rolls, ', ') .. ' }'
end

return {
  module_name = 'BowlingScorer',

  test_helpers = [[
    local function game_with(rolls)
      local scorer = BowlingScorer()
      for _, pins in ipairs(rolls) do
        scorer.roll(pins)
      end
      return scorer
    end
  ]],

  generate_test = function(case)
    local action = case.property == 'roll' and ('scorer.roll(%d)'):format(case.input.roll) or 'scorer.score()'

    if type(case.expected) == 'table' then
      local template = [[
        local scorer = game_with(%s)
        assert.has_error(function()
          %s
        end)]]
      return template:format(render_rolls(case.input.previousRolls), action)
    end

    local template = [[
      local scorer = game_with(%s)
      assert.equal(%d, %s)]]
    return template:format(render_rolls(case.input.previousRolls), case.expected, action)
  end
}
