local School = require('grade-school')

describe('grade-school', function()
  it('a new school has an empty roster', function()
    local school = School:new()
    local expected = {}
    local result = school:roster()
    assert.are.same(expected, result)
  end)

  it('adding a student adds them to the roster for the given grade', function()
    local school = School:new()
    school:add('Aimee', 2)
    local expected = { [2] = { 'Aimee' } }
    local result = school:roster()
    assert.are.same(expected, result)
  end)

  it('adding more students to the same grade adds them to the roster', function()
    local school = School:new()
    school:add('Blair', 2)
    school:add('James', 2)
    school:add('Paul', 2)
    local expected = { [2] = { 'Blair', 'James', 'Paul' } }
    local result = school:roster()
    assert.are.same(expected, result)
  end)

  it('adding students to different grades adds them to the roster', function()
    local school = School:new()
    school:add('Chelsea',3)
    school:add('Logan',7)
    local expected = { [3]={ 'Chelsea' }, [7] = { 'Logan'} }
    local result = school:roster()
    assert.are.same(expected, result)
  end)

  it('grade returns the students in that grade in alphabetical order', function()
    local school = School:new()
    school:add('Franklin', 5)
    school:add('Bradley', 5)
    school:add('Jeff', 1)
    local expected = { 'Bradley', 'Franklin' }
    local result = school:grade(5)
    assert.are.same(expected, result)
  end)

  it('grade returns an empty array if there are no students in that grade', function()
    local school = School:new()
    local result = school:grade(1)
    local expected = {}
    assert.are.same(expected, result)
  end)

  it('the students names in each grade in the roster are sorted', function()
    local school = School:new()
    school:add('Jennifer', 4)
    school:add('Kareem', 6)
    school:add('Christopher', 4)
    school:add('Kyle', 3)
    local expected = {
      [3]={ 'Kyle' },
      [4]={ 'Christopher', 'Jennifer' },
      [6]={ 'Kareem' }
    }
    local result = school:roster()
    assert.are.same(expected, result)
  end)
end)
