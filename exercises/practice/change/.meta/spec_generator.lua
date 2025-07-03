local function render_coins(coins)
  return table.concat(coins, ', ')
end

return {
  module_name = 'change',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has.error(function()
          change(%s, { %s })
        end, "%s")]]
      return template:format(case.input.target, render_coins(case.input.coins), case.expected.error)
    else
      local template = [[
        assert.same({ %s }, change(%s, { %s }))]]
      return template:format(render_coins(case.expected), case.input.target, render_coins(case.input.coins))
    end
  end
}
