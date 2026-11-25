local allergies = require('allergies')

describe('allergies', function()
  describe('testing for eggs allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'eggs'))
    end)

    it('allergic only to eggs', function()
      assert.is_true(allergies.allergic_to(1, 'eggs'))
    end)

    it('allergic to eggs and something else', function()
      assert.is_true(allergies.allergic_to(3, 'eggs'))
    end)

    it('allergic to something, but not eggs', function()
      assert.is_false(allergies.allergic_to(2, 'eggs'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'eggs'))
    end)
  end)

  describe('testing for peanuts allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'peanuts'))
    end)

    it('allergic only to peanuts', function()
      assert.is_true(allergies.allergic_to(2, 'peanuts'))
    end)

    it('allergic to peanuts and something else', function()
      assert.is_true(allergies.allergic_to(7, 'peanuts'))
    end)

    it('allergic to something, but not peanuts', function()
      assert.is_false(allergies.allergic_to(5, 'peanuts'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'peanuts'))
    end)
  end)

  describe('testing for shellfish allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'shellfish'))
    end)

    it('allergic only to shellfish', function()
      assert.is_true(allergies.allergic_to(4, 'shellfish'))
    end)

    it('allergic to shellfish and something else', function()
      assert.is_true(allergies.allergic_to(14, 'shellfish'))
    end)

    it('allergic to something, but not shellfish', function()
      assert.is_false(allergies.allergic_to(10, 'shellfish'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'shellfish'))
    end)
  end)

  describe('testing for strawberries allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'strawberries'))
    end)

    it('allergic only to strawberries', function()
      assert.is_true(allergies.allergic_to(8, 'strawberries'))
    end)

    it('allergic to strawberries and something else', function()
      assert.is_true(allergies.allergic_to(28, 'strawberries'))
    end)

    it('allergic to something, but not strawberries', function()
      assert.is_false(allergies.allergic_to(20, 'strawberries'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'strawberries'))
    end)
  end)

  describe('testing for tomatoes allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'tomatoes'))
    end)

    it('allergic only to tomatoes', function()
      assert.is_true(allergies.allergic_to(16, 'tomatoes'))
    end)

    it('allergic to tomatoes and something else', function()
      assert.is_true(allergies.allergic_to(56, 'tomatoes'))
    end)

    it('allergic to something, but not tomatoes', function()
      assert.is_false(allergies.allergic_to(40, 'tomatoes'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'tomatoes'))
    end)
  end)

  describe('testing for chocolate allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'chocolate'))
    end)

    it('allergic only to chocolate', function()
      assert.is_true(allergies.allergic_to(32, 'chocolate'))
    end)

    it('allergic to chocolate and something else', function()
      assert.is_true(allergies.allergic_to(112, 'chocolate'))
    end)

    it('allergic to something, but not chocolate', function()
      assert.is_false(allergies.allergic_to(80, 'chocolate'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'chocolate'))
    end)
  end)

  describe('testing for pollen allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'pollen'))
    end)

    it('allergic only to pollen', function()
      assert.is_true(allergies.allergic_to(64, 'pollen'))
    end)

    it('allergic to pollen and something else', function()
      assert.is_true(allergies.allergic_to(224, 'pollen'))
    end)

    it('allergic to something, but not pollen', function()
      assert.is_false(allergies.allergic_to(160, 'pollen'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'pollen'))
    end)
  end)

  describe('testing for cats allergy', function()
    it('not allergic to anything', function()
      assert.is_false(allergies.allergic_to(0, 'cats'))
    end)

    it('allergic only to cats', function()
      assert.is_true(allergies.allergic_to(128, 'cats'))
    end)

    it('allergic to cats and something else', function()
      assert.is_true(allergies.allergic_to(192, 'cats'))
    end)

    it('allergic to something, but not cats', function()
      assert.is_false(allergies.allergic_to(64, 'cats'))
    end)

    it('allergic to everything', function()
      assert.is_true(allergies.allergic_to(255, 'cats'))
    end)
  end)

  describe('list when:', function()
    it('no allergies', function()
      local expected = {}
      assert.are.same(expected, allergies.list(0))
    end)

    it('just eggs', function()
      local expected = { 'eggs' }
      assert.are.same(expected, allergies.list(1))
    end)

    it('just peanuts', function()
      local expected = { 'peanuts' }
      assert.are.same(expected, allergies.list(2))
    end)

    it('just strawberries', function()
      local expected = { 'strawberries' }
      assert.are.same(expected, allergies.list(8))
    end)

    it('eggs and peanuts', function()
      local expected = { 'eggs', 'peanuts' }
      assert.are.same(expected, allergies.list(3))
    end)

    it('more than eggs but not peanuts', function()
      local expected = { 'eggs', 'shellfish' }
      assert.are.same(expected, allergies.list(5))
    end)

    it('lots of stuff', function()
      local expected = { 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats' }
      assert.are.same(expected, allergies.list(248))
    end)

    it('everything', function()
      local expected = { 'eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats' }
      assert.are.same(expected, allergies.list(255))
    end)

    it('no allergen score parts', function()
      local expected = { 'eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats' }
      assert.are.same(expected, allergies.list(509))
    end)

    it('no allergen score parts without highest valid score', function()
      local expected = { 'eggs' }
      assert.are.same(expected, allergies.list(257))
    end)
  end)
end)
