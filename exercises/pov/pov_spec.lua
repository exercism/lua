local pov_from = require('pov').pov_from
local path_from = require('pov').path_from

describe('pov', function()
  describe('pov_from.of', function()
    it('should give the POV of a singleton as the singleton', function()
      assert.same({ 'x' }, pov_from('x').of({ 'x' }))
    end)

    it('should be able give the POV of a leaf in a simple tree', function()
      local simple_tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      local expected =
        { 'leaf', {
          { 'parent', {
            { 'sibling' }}}}}

      assert.same(expected, pov_from('leaf').of(simple_tree))
    end)

    it('should be able give the POV of the leaf of a deeply nested tree', function()
      local deeply_nested_tree =
        { 'level1', {
          { 'level2', {
            { 'level3', {
              { 'level4', {
                { 'leaf' }}}}}}}}}

      local expected =
        { 'leaf', {
          { 'level4', {
            { 'level3', {
              { 'level2', {
                { 'level1' }}}}}}}}}

      assert.same(expected, pov_from('leaf').of(deeply_nested_tree))
    end)

    it('should be able to give the POV of a leaf in a flat tree', function()
      local flat_tree =
        { 'parent', {
          { 'sibling_a' }, { 'sibling_b' }, { 'leaf' }, { 'sibling_c' }, { 'sibling_d' }}}

      local expected =
        { 'leaf', {
          { 'parent', {
            { 'sibling_a' }, { 'sibling_b' }, { 'sibling_c' }, { 'sibling_d' }}}}}

      assert.same(expected, pov_from('leaf').of(flat_tree))
    end)

    it('should be able to give the POV of a leaf in a larger tree', function()
      local larger_tree =
        { 'grand_parent', {
          { 'parent', {
            { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
          { 'uncle', {
            { 'cousin_1' }, { 'cousin_2' }}}}}

      local expected =
        { 'leaf', {
          { 'parent', {
            { 'sibling_1' },
            { 'sibling_2' },
            { 'grand_parent', {
              { 'uncle', {
                { 'cousin_1' }, { 'cousin_2' }}}}}}}}}

      assert.same(expected, pov_from('leaf').of(larger_tree))
    end)

    it('should be able to give the POV of a node with children in a larger tree', function()
      local larger_tree =
        { 'parent', {
          { 'x', {
            { 'child_1' }, { 'child_2' }}},
          { 'sibling', {
            { 'nephew' }, { 'niece' }}}}}

      local expected =
        { 'x', {
          { 'child_1' },
          { 'child_2' },
          { 'parent', {
            { 'sibling', {
              { 'nephew' }, { 'niece' }}}}}}}

      assert.same(expected, pov_from('x').of(larger_tree))
    end)

    it('should raise an error when asked to provide the POV for a non-existent node', function()
      local tree =
        { 'grand_parent', {
          { 'parent', {
            { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
          { 'uncle', {
            { 'cousin_1' }, { 'cousin_2' }}}}}

      assert.has_error(function()
        pov_from('non_existent').of(tree)
      end)
    end)

    it('should not mutate the input tree', function()
      local tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      local original_tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      pov_from('leaf').of(tree)
      assert.same(original_tree, tree)
    end)
  end)

  describe('path_from.to.of', function()
    it('should be able to give the path from a leaf to the root of a simple tree', function()
      local simple_tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      local expected = { 'leaf', 'parent' }

      assert.same(expected, path_from('leaf').to('parent').of(simple_tree))
    end)

    it('should be able to give the path between nodes in a complex tree', function()
      local complex_tree =
        { 'parent', {
          { 'x', {
            { 'child_1' }, { 'child_2' }}},
          { 'sibling', {
            { 'nephew' }, { 'niece' }}}}}

      local expected =
        { 'x', {
          { 'child_1' },
          { 'child_2' },
          { 'parent', {
            { 'sibling', {
              { 'nephew' }, { 'niece' }}}}}}}

      local expected = { 'x', 'parent', 'sibling', 'niece' }

      assert.same(expected, path_from('x').to('niece').of(complex_tree))
    end)

    it('should raise an error when the source or destination does not exist in the tree', function()
      local tree =
        { 'grand_parent', {
          { 'parent', {
            { 'sibling_1' }, { 'leaf' }, { 'sibling_2' }}},
          { 'uncle', {
            { 'cousin_1' }, { 'cousin_2' }}}}}

      assert.has_error(function()
        path_from('non_existent').to('parent').of(tree)
      end)

      assert.has_error(function()
        path_from('leaf').to('non_existent').of(tree)
      end)
    end)

    it('should not mutate the input tree', function()
      local tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      local original_tree =
        { 'parent', {
          { 'sibling' }, { 'leaf' }}}

      path_from('leaf').to('parent').of(tree)
      assert.same(original_tree, tree)
    end)
  end)
end)
