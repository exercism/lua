local BinarySearchTree = require('binary-search-tree')

describe('binary-search-tree', function()
  it('should maintain a value for each node', function()
    assert.equal(4, BinarySearchTree:new(4).value)
  end)

  it('should insert lesser values to the left', function()
    local tree = BinarySearchTree:new(4)
    tree:insert(3)
    assert.equal(4, tree.value)
    assert.equal(3, tree.left.value)
    assert.equal(nil, tree.right)
  end)

  it('should insert equal values to the left', function()
    local tree = BinarySearchTree:new(4)
    tree:insert(4)
    assert.equal(4, tree.value)
    assert.equal(4, tree.left.value)
    assert.equal(nil, tree.right)
  end)

  it('should insert greater values to the right', function()
    local tree = BinarySearchTree:new(4)
    tree:insert(5)
    assert.equal(4, tree.value)
    assert.equal(5, tree.right.value)
    assert.equal(nil, tree.left)
  end)

  it('should insert values recursively', function()
    local tree = BinarySearchTree:new(4)
    tree:insert(6)
    tree:insert(3)
    tree:insert(5)
    tree:insert(1)
    assert.equal(4, tree.value)
    assert.equal(6, tree.right.value)
    assert.equal(5, tree.right.left.value)
    assert.equal(3, tree.left.value)
    assert.equal(1, tree.left.left.value)
  end)

  it('should allow a tree to be created from a list with one element', function()
    local tree = BinarySearchTree:from_list({ 4 })
    assert.equal(4, tree.value)
    assert.equal(nil, tree.right)
    assert.equal(nil, tree.left)
  end)

  it('should allow a tree to be created from a long list', function()
    local tree = BinarySearchTree:from_list({ 4, 6, 3, 5, 1 })
    assert.equal(4, tree.value)
    assert.equal(6, tree.right.value)
    assert.equal(5, tree.right.left.value)
    assert.equal(3, tree.left.value)
    assert.equal(1, tree.left.left.value)
  end)

  it('should not allow a tree to be created from an empty list', function()
    assert.has_error(function()
     BinarySearchTree:from_list({})
    end)
  end)

  it('should provide a generator to iterate over all values in ascending order', function()
    local tree = BinarySearchTree:from_list({ 2, 4, 6, 3, 5, 1 })
    local expected = { 1, 2, 3, 4, 5, 6 }
    local actual = {}

    for v in tree:values() do
      table.insert(actual, v)
    end

    assert.same(expected, actual)
  end)
end)
