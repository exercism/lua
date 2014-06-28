local Words = require("words")

describe("Words", function() 

  it("counts one word", function() 
    local result = Words:new("word"):count()
    local expected =  { word = "1" }
    assert.are.same(expected,result)
  end)

  it("counts one of each", function()
    local result = Words:new("one of each"):count()
    local expected =  {one="1", of="1", each="1"}
    assert.are.same(expected,result)
  end)

  it("counts multiple occurrences", function()
    local result = Words:new("one fish two fish red fish blue fish"):count()
    local expected =  {one= "1", fish = "4", two = "1", red = "1", blue = "1" }
    assert.are.same(expected,result)
  end)

  it("ignores punctuation", function()
    local result = Words:new("car : carpet as java : javascript!!&@$%^&"):count()
    local expected = { car = "1", carpet = "1", as = "1", java = "1", javascript = "1" }
    assert.are.same(expected,result)
  end)

  it("includes numbers", function()
    local result = Words:new("testing, 1, 2 testing"):count()
    local expected =  {["testing"] = "2", ["1"] = "1", ["2"] = "1"}
    assert.are.same(expected,result)
  end)

  it("normalizes case", function()
    local result = Words:new("go Go GO"):count()
    local expected =  {go = "3" }
    assert.are.same(expected,result)
  end)

end)

