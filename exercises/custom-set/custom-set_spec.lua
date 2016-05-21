local Set = require('custom-set')

describe('custom-set', function()
  describe('is_empty', function()
    it('should indicate that an empty set is empty', function()
      assert.is_true(Set():is_empty())
    end)

    it('should indicate that sets with elemnts are non-empty', function()
      assert.is_false(Set(1):is_empty())
    end)
  end)

  describe('contains', function()
    it('should indicate that nothing is an element of an empty set', function()
      assert.is_false(Set():contains(1))
    end)

    it('should indicate that an element is contained in a set that contains the element', function()
      assert.is_true(Set(1, 2, 3):contains(1))
      assert.is_true(Set(1, 2, 3):contains(2))
      assert.is_true(Set(1, 2, 3):contains(3))
    end)

    it('should indicate that an element that is not in a set is not contained in the set', function()
      assert.is_false(Set(1, 2, 3):contains(4))
    end)
  end)

  describe('is_subset', function()
    it('should indicate that an empty set is a subset of another empty set', function()
      assert.is_true(Set():is_subset(Set()))
    end)

    it('should indicate that an empty set is a subset of a non-empty set', function()
      assert.is_true(Set():is_subset(Set(1)))
    end)

    it('should indicate that a non-empty set is not a subset of an empty set', function()
      assert.is_false(Set(1):is_subset(Set()))
    end)

    it('should indicate that a non-empty set is a subset of itself', function()
      assert.is_true(Set(1, 2, 3):is_subset(Set(1, 2, 3)))
    end)

    it('should indicate that a proper subset is a subset', function()
      assert.is_true(Set(1, 2, 3):is_subset(Set(4, 1, 2, 3)))
    end)

    it('should indicate that a set is not a subset of another set with different elements but the same element count', function()
      assert.is_false(Set(1, 2, 3):is_subset(Set(4, 1, 3)))
    end)
  end)

  describe('is_disjoint', function()
    it('should indicate that the empty set is disjoint with itself', function()
      assert.is_true(Set():is_disjoint(Set()))
    end)

    it('should indicate that the empty set is disjoint with a non-empty set', function()
      assert.is_true(Set():is_disjoint(Set(1)))
    end)

    it('should indicate that a non-empty set is not disjoint with an empty set', function()
      assert.is_true(Set(1):is_disjoint(Set()))
    end)

    it('should indicate that sets with an element in common are not disjoint', function()
      assert.is_false(Set(1, 2):is_disjoint(Set(2, 3)))
    end)

    it('should indicate that sets with no elements in common are disjoint', function()
      assert.is_true(Set(1, 2):is_disjoint(Set(3, 4)))
    end)
  end)

  describe('equality', function()
    it('should consider empty sets equal', function()
      assert.is_true(Set():equals(Set()))
    end)

    it('should not consider an empty set to be equal to a non-empty set', function()
      assert.is_false(Set():equals(Set(1, 2, 3)))
    end)

    it('should not consider a non-empty set to be equal to an empty set', function()
      assert.is_false(Set(1, 2, 3):equals(Set()))
    end)

    it('should ignore order', function()
      assert.is_true(Set(1, 3):equals(Set(3, 1)))
    end)

    it('should consider different sets to be different', function()
      assert.is_false(Set(1, 2, 3):equals(Set(1, 2, 4)))
    end)
  end)

  describe('add', function()
    it('should allow an element to be added to an empty set', function()
      local s = Set()
      s:add(3)
      assert.is_true(s:contains(3))
    end)

    it('should allow an element to be added to a non-empty set', function()
      local s = Set(1, 2, 4)
      s:add(3)
      assert.is_true(s:equals(Set(1, 2, 3, 4)))
    end)

    it('should allow an element to be re-added to a set', function()
      local s = Set(1, 2, 3)
      s:add(3)
      assert.is_true(s:equals(Set(1, 2, 3)))
    end)
  end)

  describe('intersection', function()
    it('should give the empty set as the intersection of two empty sets', function()
      assert.is_true(Set():intersection(Set()):equals(Set()))
    end)

    it('should intersect an empty set with a non-empty set', function()
      assert.is_true(Set():intersection(Set(3, 2, 5)):equals(Set()))
    end)

    it('should intersect a non-empty set with an empty set', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set()):equals(Set()))
    end)

    it('should intersect a single element set with itself', function()
      assert.is_true(Set(3):intersection(Set(3)):equals(Set(3)))
    end)

    it('should intersect sets with a single element in common', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(3, 4, 5)):equals(Set(3)))
    end)

    it('should intersect sets with a multiple elements in common', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set(3, 2, 5)):equals(Set(2, 3)))
    end)

    it('should intersect a set with a subset', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(2, 3)):equals(Set(2, 3)))
    end)

    it('should intersect sets with no elements in common', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(4, 5, 6)):equals(Set()))
    end)
  end)

  describe('intersection', function()
    it('should give the empty set as the intersection of two empty sets', function()
      assert.is_true(Set():intersection(Set()):equals(Set()))
    end)

    it('should intersect an empty set with a non-empty set', function()
      assert.is_true(Set():intersection(Set(3, 2, 5)):equals(Set()))
    end)

    it('should intersect a non-empty set with an empty set', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set()):equals(Set()))
    end)

    it('should intersect a single element set with itself', function()
      assert.is_true(Set(3):intersection(Set(3)):equals(Set(3)))
    end)

    it('should intersect sets with a single element in common', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(3, 4, 5)):equals(Set(3)))
    end)

    it('should intersect sets with a multiple elements in common', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set(3, 2, 5)):equals(Set(2, 3)))
    end)

    it('should intersect a set with a subset', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(2, 3)):equals(Set(2, 3)))
    end)

    it('should intersect sets with no elements in common', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(4, 5, 6)):equals(Set()))
    end)
  end)

  describe('difference', function()
    it('should give the difference of two empty sets as the empty set', function()
      assert.is_true(Set():difference(Set()):equals(Set()))
    end)

    it('should give the difference of an empty set and a non-empty set as the empty set', function()
      assert.is_true(Set():difference(Set(3, 2, 5)):equals(Set()))
    end)

    it('should give the difference of a non-empty set and the empty set as the non-empty set', function()
      assert.is_true(Set(1, 2, 3, 4):difference(Set()):equals(Set(1, 2, 3, 4)))
    end)

    it('should give the difference of two sets with an intersection', function()
      assert.is_true(Set(3, 2, 1):difference(Set(2, 4)):equals(Set(1, 3)))
    end)
  end)

  describe('union', function()
    it('should produce the empty set as the union of two empty sets', function()
      assert.is_true(Set():union(Set()):equals(Set()))
    end)

    it('should give the union of an empty set with another set as the other set', function()
      assert.is_true(Set():union(Set(2)):equals(Set(2)))
    end)

    it('should give the union of a non-empty set and an empty set as the non-empty set', function()
      assert.is_true(Set(1, 3):union(Set()):equals(Set(1, 3)))
    end)

    it('should produce the union of different sets', function()
      assert.is_true(Set(1, 3):union(Set(2, 3)):equals(Set(1, 2, 3)))
    end)
  end)
end)
