local Set = require('custom-set')

describe('custom-set', function()
  describe('returns true if the set contains no elements', function()
    it('sets with no elements are empty', function()
      assert.is_true(Set():is_empty())
    end)

    it('sets with elements are not empty', function()
      assert.is_false(Set(1):is_empty())
    end)
  end)

  describe('sets can report if they contain an element', function()
    it('nothing is contained in an empty set', function()
      assert.is_false(Set():contains(1))
    end)

    it('when the element is in the set', function()
      assert.is_true(Set(1, 2, 3):contains(1))
    end)

    it('when the element is not in the set', function()
      assert.is_false(Set(1, 2, 3):contains(4))
    end)
  end)

  describe('a set is a subset if all of its elements are contained in the other set', function()
    it('empty set is a subset of another empty set', function()
      assert.is_true(Set():is_subset(Set()))
    end)

    it('empty set is a subset of non-empty set', function()
      assert.is_true(Set():is_subset(Set(1)))
    end)

    it('non-empty set is not a subset of empty set', function()
      assert.is_false(Set(1):is_subset(Set()))
    end)

    it('set is a subset of set with exact same elements', function()
      assert.is_true(Set(1, 2, 3):is_subset(Set(1, 2, 3)))
    end)

    it('set is a subset of larger set with same elements', function()
      assert.is_true(Set(1, 2, 3):is_subset(Set(4, 1, 2, 3)))
    end)

    it('set is not a subset of set that does not contain its elements', function()
      assert.is_false(Set(1, 2, 3):is_subset(Set(4, 1, 3)))
    end)
  end)

  describe('sets are disjoint if they share no elements', function()
    it('the empty set is disjoint with itself', function()
      assert.is_true(Set():is_disjoint(Set()))
    end)

    it('empty set is disjoint with non-empty set', function()
      assert.is_true(Set():is_disjoint(Set(1)))
    end)

    it('non-empty set is disjoint with empty set', function()
      assert.is_true(Set(1):is_disjoint(Set()))
    end)

    it('sets are not disjoint if they share an element', function()
      assert.is_false(Set(1, 2):is_disjoint(Set(2, 3)))
    end)

    it('sets are disjoint if they share no elements', function()
      assert.is_true(Set(1, 2):is_disjoint(Set(3, 4)))
    end)
  end)

  describe('sets with the same elements are equal', function()
    it('empty sets are equal', function()
      assert.is_true(Set():equals(Set()))
    end)

    it('empty set is not equal to non-empty set', function()
      assert.is_false(Set():equals(Set(1, 2, 3)))
    end)

    it('non-empty set is not equal to empty set', function()
      assert.is_false(Set(1, 2, 3):equals(Set()))
    end)

    it('sets with the same elements are equal', function()
      assert.is_true(Set(1, 2):equals(Set(2, 1)))
    end)

    it('sets with different elements are not equal', function()
      assert.is_false(Set(1, 2, 3):equals(Set(1, 2, 4)))
    end)

    it('set is not equal to larger set with same elements', function()
      assert.is_false(Set(1, 2, 3):equals(Set(1, 2, 3, 4)))
    end)

    it('set is equal to a set constructed from an array with duplicates', function()
      assert.is_true(Set(1):equals(Set(1, 1)))
    end)
  end)

  describe('unique elements can be added to a set', function()
    it('add to empty set', function()
      local s = Set()
      s:add(3)
      assert.is_true(s:equals(Set(3)))
    end)

    it('add to non-empty set', function()
      local s = Set(1, 2, 4)
      s:add(3)
      assert.is_true(s:equals(Set(1, 2, 3, 4)))
    end)

    it('adding an existing element does not change the set', function()
      local s = Set(1, 2, 3)
      s:add(3)
      assert.is_true(s:equals(Set(1, 2, 3)))
    end)
  end)

  describe('intersection returns a set of all shared elements', function()
    it('intersection of two empty sets is an empty set', function()
      assert.is_true(Set():intersection(Set()):equals(Set()))
    end)

    it('intersection of an empty set and non-empty set is an empty set', function()
      assert.is_true(Set():intersection(Set(3, 2, 5)):equals(Set()))
    end)

    it('intersection of a non-empty set and an empty set is an empty set', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set()):equals(Set()))
    end)

    it('intersection of two sets with no shared elements is an empty set', function()
      assert.is_true(Set(1, 2, 3):intersection(Set(4, 5, 6)):equals(Set()))
    end)

    it('intersection of two sets with shared elements is a set of the shared elements', function()
      assert.is_true(Set(1, 2, 3, 4):intersection(Set(3, 2, 5)):equals(Set(2, 3)))
    end)
  end)

  describe('difference (or complement) of a set is a set of all elements that are only in the first set', function()
    it('difference of two empty sets is an empty set', function()
      assert.is_true(Set():difference(Set()):equals(Set()))
    end)

    it('difference of empty set and non-empty set is an empty set', function()
      assert.is_true(Set():difference(Set(3, 2, 5)):equals(Set()))
    end)

    it('difference of a non-empty set and an empty set is the non-empty set', function()
      assert.is_true(Set(1, 2, 3, 4):difference(Set()):equals(Set(1, 2, 3, 4)))
    end)

    it('difference of two non-empty sets is a set of elements that are only in the first set', function()
      assert.is_true(Set(3, 2, 1):difference(Set(2, 4)):equals(Set(1, 3)))
    end)

    it('difference removes all duplicates in the first set', function()
      assert.is_true(Set(1, 1):difference(Set(1)):equals(Set()))
    end)
  end)

  describe('union returns a set of all elements in either set', function()
    it('union of empty sets is an empty set', function()
      assert.is_true(Set():union(Set()):equals(Set()))
    end)

    it('union of an empty set and non-empty set is the non-empty set', function()
      assert.is_true(Set():union(Set(2)):equals(Set(2)))
    end)

    it('union of a non-empty set and empty set is the non-empty set', function()
      assert.is_true(Set(1, 3):union(Set()):equals(Set(1, 3)))
    end)

    it('union of non-empty sets contains all unique elements', function()
      assert.is_true(Set(1, 3):union(Set(2, 3)):equals(Set(3, 2, 1)))
    end)
  end)
end)
