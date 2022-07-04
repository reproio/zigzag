# frozen_string_literal: true

require_relative "zigzag/version"
require_relative "zigzag/zigzag"

module Zigzag
  def encode(n)
    begin
      return encode_fast(n)
    rescue RangeError
      # fallback ruby implementation
      buf = +""
      n = (n << 1) ^ (n >> 63)
      while (n & ~0x7F) != 0
        buf << ((n & 0x7f) | 0x80).chr
        n >>= 7
      end
      buf << n.chr
      buf
    end
  end
  module_function :encode
end
