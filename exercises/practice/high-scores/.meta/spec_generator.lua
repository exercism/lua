local utils = require 'utils'

local METHODS = {
  scores = 'scores',
  latest = 'latest',
  personalBest = 'personal_best',
  personalTopThree = 'personal_top_three',
  latestAfterTopThree = 'latest',
  scoresAfterTopThree = 'scores',
  latestAfterBest = 'latest',
  scoresAfterBest = 'scores'
}

local PRECEDING_CALLS = {
  latestAfterTopThree = 'personal_top_three',
  scoresAfterTopThree = 'personal_top_three',
  latestAfterBest = 'personal_best',
  scoresAfterBest = 'personal_best'
}

local function render_list(values)
  return '{ ' .. table.concat(utils.map(values, tostring), ', ') .. ' }'
end

return {
  module_name = 'HighScores',

  generate_test = function(case)
    local lines = { ('local values = %s'):format(render_list(case.input.scores)), 'local scores = HighScores(values)' }

    local preceding = PRECEDING_CALLS[case.property]
    if preceding then
      table.insert(lines, ('local _ = scores:%s()'):format(preceding))
    end

    if type(case.expected) == 'table' then
      table.insert(lines, ('local expected = %s'):format(render_list(case.expected)))
      table.insert(lines, ('assert.are.same(expected, scores:%s())'):format(METHODS[case.property]))
    else
      table.insert(lines, ('local expected = %d'):format(case.expected))
      table.insert(lines, ('assert.equal(expected, scores:%s())'):format(METHODS[case.property]))
    end

    return table.concat(lines, '\n')
  end
}
