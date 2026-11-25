return {
  module_name = 'meetup',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%d, meetup({ year = %d, month = %d, week = '%s', day = '%s' }))]]
    return template:format(tonumber(case.expected:match('%d+$')), case.input.year, case.input.month, case.input.week,
                           case.input.dayofweek)
  end
}
