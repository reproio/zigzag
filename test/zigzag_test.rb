# frozen_string_literal: true

require "test_helper"

class ZigzagTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Zigzag.const_defined?(:VERSION)
    end
  end

  test "encode" do
    assert_equal("\0".b, Zigzag.encode(0))
    assert_equal("\01".b, Zigzag.encode(-1))
    assert_equal("\02".b, Zigzag.encode(1))
    assert_equal("\03".b, Zigzag.encode(-2))
    assert_equal("\04".b, Zigzag.encode(2))
    assert_equal("\x7E".b, Zigzag.encode(63))
    assert_equal("\x7F".b, Zigzag.encode(-64))
    assert_equal("\x80\x01".b, Zigzag.encode(64))
    assert_equal("\xFF\x7F".b, Zigzag.encode(-8192))
    assert_equal("\x80\x80\x01".b, Zigzag.encode(8192))
    assert_equal("\x81\x80\x01".b, Zigzag.encode(-8193))
    assert_equal("\x80\x80\x80\x80\x80\x80\x80\x80\x80\x01".b, Zigzag.encode(1<<62))
    assert_equal("\xFE\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x01".b, Zigzag.encode((1<<63) - 1))
    assert_equal("\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x01".b, Zigzag.encode(-(1<<63)))
    assert_equal("\x80\x80\x80\x80\x80\x80\x80\x80\x80\x02".b, Zigzag.encode(-(1<<63)-1))
    assert_equal("\x81\x80\x80\x80\x80\x80\x80\x80\x80\x02".b, Zigzag.encode(1<<63))
  end
end
