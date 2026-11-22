local utils = require 'utils'

return {
  module_name = 'say',

  module_loader = "(loadfile 'say.lua')() -- busted has a built-in 'say' module; load the file directly",

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function()
          say(%d)
        end)]]
      return template:format(case.input.number)
    end

    return ('assert.are.equal(%s, say(%d))'):format(utils.stringify(case.expected), case.input.number)
  end
}
