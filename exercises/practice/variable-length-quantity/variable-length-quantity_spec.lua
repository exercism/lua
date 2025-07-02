local vlq = require('variable-length-quantity')

describe('variable-length-quantity', function()
  describe('encode a series of integers, producing a series of bytes.', function()
    it('zero', function()
      assert.are.same({ 0x0 }, vlq.encode({ 0x0 }))
    end)

    it('arbitrary single byte', function()
      assert.are.same({ 0x40 }, vlq.encode({ 0x40 }))
    end)

    it('asymmetric single byte', function()
      assert.are.same({ 0x53 }, vlq.encode({ 0x53 }))
    end)

    it('largest single byte', function()
      assert.are.same({ 0x7f }, vlq.encode({ 0x7f }))
    end)

    it('smallest double byte', function()
      assert.are.same({ 0x81, 0x0 }, vlq.encode({ 0x80 }))
    end)

    it('arbitrary double byte', function()
      assert.are.same({ 0xc0, 0x0 }, vlq.encode({ 0x2000 }))
    end)

    it('asymmetric double byte', function()
      assert.are.same({ 0x81, 0x2d }, vlq.encode({ 0xad }))
    end)

    it('largest double byte', function()
      assert.are.same({ 0xff, 0x7f }, vlq.encode({ 0x3fff }))
    end)

    it('smallest triple byte', function()
      assert.are.same({ 0x81, 0x80, 0x0 }, vlq.encode({ 0x4000 }))
    end)

    it('arbitrary triple byte', function()
      assert.are.same({ 0xc0, 0x80, 0x0 }, vlq.encode({ 0x100000 }))
    end)

    it('asymmetric triple byte', function()
      assert.are.same({ 0x87, 0xab, 0x1c }, vlq.encode({ 0x1d59c }))
    end)

    it('largest triple byte', function()
      assert.are.same({ 0xff, 0xff, 0x7f }, vlq.encode({ 0x1fffff }))
    end)

    it('smallest quadruple byte', function()
      assert.are.same({ 0x81, 0x80, 0x80, 0x0 }, vlq.encode({ 0x200000 }))
    end)

    it('arbitrary quadruple byte', function()
      assert.are.same({ 0xc0, 0x80, 0x80, 0x0 }, vlq.encode({ 0x8000000 }))
    end)

    it('asymmetric quadruple byte', function()
      assert.are.same({ 0x81, 0xd5, 0xee, 0x4 }, vlq.encode({ 0x357704 }))
    end)

    it('largest quadruple byte', function()
      assert.are.same({ 0xff, 0xff, 0xff, 0x7f }, vlq.encode({ 0xfffffff }))
    end)

    it('smallest quintuple byte', function()
      assert.are.same({ 0x81, 0x80, 0x80, 0x80, 0x0 }, vlq.encode({ 0x10000000 }))
    end)

    it('arbitrary quintuple byte', function()
      assert.are.same({ 0x8f, 0xf8, 0x80, 0x80, 0x0 }, vlq.encode({ 0xff000000 }))
    end)

    it('asymmetric quintuple byte', function()
      assert.are.same({ 0x88, 0xb3, 0x95, 0xc2, 0x5 }, vlq.encode({ 0x86656105 }))
    end)

    it('maximum 32-bit integer input', function()
      assert.are.same({ 0x8f, 0xff, 0xff, 0xff, 0x7f }, vlq.encode({ 0xffffffff }))
    end)

    it('two single-byte values', function()
      assert.are.same({ 0x40, 0x7f }, vlq.encode({ 0x40, 0x7f }))
    end)

    it('two multi-byte values', function()
      assert.are.same({ 0x81, 0x80, 0x0, 0xc8, 0xe8, 0x56 }, vlq.encode({ 0x4000, 0x123456 }))
    end)

    it('many multi-byte values', function()
      assert.are.same({ 0xc0, 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81, 0x80, 0x0 },
                      vlq.encode({ 0x2000, 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000 }))
    end)
  end)

  describe('decode a series of bytes, producing a series of integers.', function()
    it('one byte', function()
      assert.are.same({ 0x7f }, vlq.decode({ 0x7f }))
    end)

    it('two bytes', function()
      assert.are.same({ 0x2000 }, vlq.decode({ 0xc0, 0x0 }))
    end)

    it('three bytes', function()
      assert.are.same({ 0x1fffff }, vlq.decode({ 0xff, 0xff, 0x7f }))
    end)

    it('four bytes', function()
      assert.are.same({ 0x200000 }, vlq.decode({ 0x81, 0x80, 0x80, 0x0 }))
    end)

    it('maximum 32-bit integer', function()
      assert.are.same({ 0xffffffff }, vlq.decode({ 0x8f, 0xff, 0xff, 0xff, 0x7f }))
    end)

    it('incomplete sequence causes error', function()
      assert.has_error(function()
        vlq.decode({ 0xff })
      end)
    end)

    it('incomplete sequence causes error, even if value is zero', function()
      assert.has_error(function()
        vlq.decode({ 0x80 })
      end)
    end)

    it('multiple values', function()
      assert.are.same({ 0x2000, 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000 }, vlq.decode(
                        { 0xc0, 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81, 0x80, 0x0 }))
    end)
  end)
end)
