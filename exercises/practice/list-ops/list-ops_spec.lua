local list_ops = require('list-ops')

describe('list-ops', function()
  describe('append entries to a list and return the new list', function()
    it('empty lists', function()
      local expected = {}
      local actual = list_ops.append({}, {})
      assert.are.same(expected, actual)
    end)

    it('list to empty list', function()
      local expected = { 1, 2, 3, 4 }
      local actual = list_ops.append({}, { 1, 2, 3, 4 })
      assert.are.same(expected, actual)
    end)

    it('empty list to list', function()
      local expected = { 1, 2, 3, 4 }
      local actual = list_ops.append({ 1, 2, 3, 4 }, {})
      assert.are.same(expected, actual)
    end)

    it('non-empty lists', function()
      local expected = { 1, 2, 2, 3, 4, 5 }
      local actual = list_ops.append({ 1, 2 }, { 2, 3, 4, 5 })
      assert.are.same(expected, actual)
    end)
  end)

  describe('concatenate a list of lists', function()
    it('empty list', function()
      local expected = {}
      local actual = list_ops.concat()
      assert.are.same(expected, actual)
    end)

    it('list of lists', function()
      local expected = { 1, 2, 3, 4, 5, 6 }
      local actual = list_ops.concat({ 1, 2 }, { 3 }, {}, { 4, 5, 6 })
      assert.are.same(expected, actual)
    end)

    it('list of nested lists', function()
      local expected = { { 1 }, { 2 }, { 3 }, {}, { 4, 5, 6 } }
      local actual = list_ops.concat({ { 1 }, { 2 } }, { { 3 } }, { {} }, { { 4, 5, 6 } })
      assert.are.same(expected, actual)
    end)
  end)

  describe('filter list returning only values that satisfy the filter function', function()
    it('empty list', function()
      local expected = {}
      local actual = list_ops.filter({}, function(x)
        return x % 2 == 1
      end)
      assert.are.same(expected, actual)
    end)

    it('non-empty list', function()
      local expected = { 1, 3, 5 }
      local actual = list_ops.filter({ 1, 2, 3, 5 }, function(x)
        return x % 2 == 1
      end)
      assert.are.same(expected, actual)
    end)
  end)

  describe('returns the length of a list', function()
    it('empty list', function()
      local expected = 0
      local actual = list_ops.length({})
      assert.are.same(expected, actual)
    end)

    it('non-empty list', function()
      local expected = 4
      local actual = list_ops.length({ 1, 2, 3, 4 })
      assert.are.same(expected, actual)
    end)
  end)

  describe('return a list of elements whose values equal the list value transformed by the mapping function', function()
    it('empty list', function()
      local expected = {}
      local actual = list_ops.map({}, function(x)
        return x + 1
      end)
      assert.are.same(expected, actual)
    end)

    it('non-empty list', function()
      local expected = { 2, 4, 6, 8 }
      local actual = list_ops.map({ 1, 3, 5, 7 }, function(x)
        return x + 1
      end)
      assert.are.same(expected, actual)
    end)
  end)

  describe('folds (reduces) the given list from the left with a function', function()
    it('empty list', function()
      local expected = 2
      local actual = list_ops.foldl({}, 2, function(acc, el)
        return el * acc
      end)
      assert.are.same(expected, actual)
    end)

    it('direction independent function applied to non-empty list', function()
      local expected = 15
      local actual = list_ops.foldl({ 1, 2, 3, 4 }, 5, function(acc, el)
        return el + acc
      end)
      assert.are.same(expected, actual)
    end)

    it('direction dependent function applied to non-empty list', function()
      local expected = 64
      local actual = list_ops.foldl({ 1, 2, 3, 4 }, 24, function(acc, el)
        return el / acc
      end)
      assert.are.same(expected, actual)
    end)
  end)

  describe('folds (reduces) the given list from the right with a function', function()
    it('empty list', function()
      local expected = 2
      local actual = list_ops.foldr({}, 2, function(acc, el)
        return el * acc
      end)
      assert.are.same(expected, actual)
    end)

    it('direction independent function applied to non-empty list', function()
      local expected = 15
      local actual = list_ops.foldr({ 1, 2, 3, 4 }, 5, function(acc, el)
        return el + acc
      end)
      assert.are.same(expected, actual)
    end)

    it('direction dependent function applied to non-empty list', function()
      local expected = 9
      local actual = list_ops.foldr({ 1, 2, 3, 4 }, 24, function(acc, el)
        return el / acc
      end)
      assert.are.same(expected, actual)
    end)
  end)

  describe('reverse the elements of the list', function()
    it('empty list', function()
      local expected = {}
      local actual = list_ops.reverse({})
      assert.are.same(expected, actual)
    end)

    it('non-empty list', function()
      local expected = { 7, 5, 3, 1 }
      local actual = list_ops.reverse({ 1, 3, 5, 7 })
      assert.are.same(expected, actual)
    end)

    it('list of lists is not flattened', function()
      local expected = { { 4, 5, 6 }, {}, { 3 }, { 1, 2 } }
      local actual = list_ops.reverse({ { 1, 2 }, { 3 }, {}, { 4, 5, 6 } })
      assert.are.same(expected, actual)
    end)
  end)
end)
