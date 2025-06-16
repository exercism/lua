return {
  module_name = 'bob',

  generate_test = function(case)
    local template = [[
      local result = bob.hey("%s")
      assert.are.equals("%s", result)]]
    return template:format(
      case.input.heyBob:gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t"),
      case.expected:gsub("Sure.", "Sure"):gsub("Whatever.", "Whatever"):gsub("Fine. Be that way!", "Fine, be that way."))
  end
}
