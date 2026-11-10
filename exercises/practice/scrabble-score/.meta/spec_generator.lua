local utils = require 'utils'

return {
  module_name = 'scrabble_score',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%d, scrabble_score.score(%s))]]
    return template:format(case.expected, utils.stringify(case.input.word))
  end
}
