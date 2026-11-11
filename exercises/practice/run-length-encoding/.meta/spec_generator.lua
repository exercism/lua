local utils = require 'utils'

return {
  module_name = 'rle',

  generate_test = function(case)
    if case.property == 'consistency' then
      local template = [[
        assert.equal(%s, rle.decode(rle.encode(%s)))]]
      return template:format(utils.stringify(case.expected), utils.stringify(case.input.string))
    else
      local template = [[
        assert.equal(%s, rle.%s(%s))]]
      return template:format(utils.stringify(case.expected), case.property, utils.stringify(case.input.string))
    end
  end
}
