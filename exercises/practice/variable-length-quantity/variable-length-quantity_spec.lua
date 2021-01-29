local vlq = require 'variable-length-quantity'

describe('variable-length-quantity', function()
  it('should decode single bytes', function()
    assert.are.same({ 0x00 }, vlq.decode({ 0x00 }))
    assert.are.same({ 0x40 }, vlq.decode({ 0x40 }))
    assert.are.same({ 0x7f }, vlq.decode({ 0x7f }))
  end)

  it('should decode double bytes', function()
    assert.are.same({ 0x80 }, vlq.decode({ 0x81, 0x00 }))
    assert.are.same({ 0x2000 }, vlq.decode({ 0xc0, 0x00 }))
    assert.are.same({ 0x3fff }, vlq.decode({ 0xff, 0x7f }))
  end)

  it('should decode triple bytes', function()
    assert.are.same({ 0x4000 }, vlq.decode({ 0x81, 0x80, 0x00 }))
    assert.are.same({ 0x100000 }, vlq.decode({ 0xc0, 0x80, 0x00 }))
    assert.are.same({ 0x1fffff }, vlq.decode({ 0xff, 0xff, 0x7f }))
  end)

  it('should decode quadruple bytes', function()
    assert.are.same({ 0x200000 }, vlq.decode({ 0x81, 0x80, 0x80, 0x00 }))
    assert.are.same({ 0x08000000 }, vlq.decode({ 0xc0, 0x80, 0x80, 0x00 }))
    assert.are.same({ 0x0fffffff }, vlq.decode({ 0xff, 0xff, 0xff, 0x7f }))
  end)

  it('should decode multiple values', function()
    assert.are.same(
      { 0x2000, 0x123456, 0x0fffffff, 0x00, 0x3fff, 0x4000 },
      vlq.decode({ 0xc0, 0x00, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x00, 0xff, 0x7f, 0x81, 0x80, 0x00 })
    )
  end)

  it('should encode single bytes', function()
    assert.are.same({ 0x00 }, vlq.encode({ 0x00 }))
    assert.are.same({ 0x40 }, vlq.encode({ 0x40 }))
    assert.are.same({ 0x7f }, vlq.encode({ 0x7f }))
  end)

  it('should encode double bytes', function()
    assert.are.same({ 0x81, 0x00 }, vlq.encode({ 0x80 }))
    assert.are.same({ 0xc0, 0x00 }, vlq.encode({ 0x2000 }))
    assert.are.same({ 0xff, 0x7f }, vlq.encode({ 0x3fff }))
  end)

  it('should encode triple bytes', function()
    assert.are.same({ 0x81, 0x80, 0x00 }, vlq.encode({ 0x4000 }))
    assert.are.same({ 0xc0, 0x80, 0x00 }, vlq.encode({ 0x100000 }))
    assert.are.same({ 0xff, 0xff, 0x7f }, vlq.encode({ 0x1fffff }))
  end)

  it('should encode quadruple bytes', function()
    assert.are.same({ 0x81, 0x80, 0x80, 0x00 }, vlq.encode({ 0x200000 }))
    assert.are.same({ 0xc0, 0x80, 0x80, 0x00 }, vlq.encode({ 0x08000000 }))
    assert.are.same({ 0xff, 0xff, 0xff, 0x7f }, vlq.encode({ 0x0fffffff }))
  end)

  it('should encode multiple values', function()
    assert.are.same({ 0x40, 0x7f }, vlq.encode({ 0x40, 0x7f }))
    assert.are.same({ 0x81, 0x80, 0x00, 0xc8, 0xe8, 0x56 }, vlq.encode({ 0x4000, 0x123456 }))
    assert.are.same(
      { 0xc0, 0x00, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x00, 0xff, 0x7f, 0x81, 0x80, 0x00 },
      vlq.encode({ 0x2000, 0x123456, 0x0fffffff, 0x00, 0x3fff, 0x4000 })
    )
  end)

  it('should raise an error when decoding an incomplete byte sequence', function()
    assert.has.error(function()
      vlq.decode({ 0x81, 0x00, 0x80 })
    end, 'incomplete byte sequence')
  end)
end)
