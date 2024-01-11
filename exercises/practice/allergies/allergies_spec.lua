local allergies = require('allergies')

describe('allergies', function()
  it('should return an empty list of allergies for a score of 0', function()
    assert.same({}, allergies.list(0))
  end)

  it('should list only eggs for a score of 1', function()
    assert.same({ 'eggs' }, allergies.list(1))
  end)

  it('should list only peanuts for a score of 2', function()
    assert.same({ 'peanuts' }, allergies.list(2))
  end)

  it('should list only shellfish for a score of 4', function()
    assert.same({ 'shellfish' }, allergies.list(4))
  end)

  it('should list only strawberries for a score of 8', function()
    assert.same({ 'strawberries' }, allergies.list(8))
  end)

  it('should list only tomatoes for a score of 16', function()
    assert.same({ 'tomatoes' }, allergies.list(16))
  end)

  it('should list only chocolate for a score of 32', function()
    assert.same({ 'chocolate' }, allergies.list(32))
  end)

  it('should list only pollen for a score of 64', function()
    assert.same({ 'pollen' }, allergies.list(64))
  end)

  it('should list only cats for a score of 128', function()
    assert.same({ 'cats' }, allergies.list(128))
  end)

  it('should be able to list more than one allergy', function()
    assert.same({ 'eggs', 'peanuts' }, allergies.list(3))
  end)

  it('should be able to list many allergies', function()
    assert.same({ 'strawberries', 'tomatoes', 'pollen', 'cats' }, allergies.list(216))
  end)

  it('should ignore components of the score that do not correspond to an allergy', function()
    assert.same({ 'eggs', 'peanuts' }, allergies.list(259))
  end)

  it('should be able to list all allergies', function()
    assert.same({ 'eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats' },
                allergies.list(255))
  end)

  it('should indicate that someone with a score of 0 is allergic to nothing', function()
    assert.is_false(allergies.allergic_to(0, 'eggs'))
    assert.is_false(allergies.allergic_to(0, 'peanuts'))
    assert.is_false(allergies.allergic_to(0, 'shellfish'))
    assert.is_false(allergies.allergic_to(0, 'strawberries'))
    assert.is_false(allergies.allergic_to(0, 'tomatoes'))
    assert.is_false(allergies.allergic_to(0, 'chocolate'))
    assert.is_false(allergies.allergic_to(0, 'pollen'))
    assert.is_false(allergies.allergic_to(0, 'cats'))
  end)

  it('should be able to determine whether a score with one allergy contains an allergy', function()
    assert.is_true(allergies.allergic_to(1, 'eggs'))
    assert.is_false(allergies.allergic_to(1, 'peanuts'))
  end)

  it('should be able to determine whether a score with multiple allergies contains an allergy', function()
    assert.is_true(allergies.allergic_to(5, 'eggs'))
    assert.is_true(allergies.allergic_to(5, 'shellfish'))
    assert.is_false(allergies.allergic_to(5, 'peanuts'))
  end)
end)
