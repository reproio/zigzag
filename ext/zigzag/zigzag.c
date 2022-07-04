#include "zigzag.h"

VALUE rb_mZigzag;

static VALUE zigzag_encode(VALUE self, VALUE vn) {
  char buf[10], *ptr = buf;
  long l = NUM2LONG(vn);
  unsigned long n = (l << 1) ^ (l >> 63);
  while ((n & ~0x7F) != 0) {
    *ptr++ = (n & 0x7f) | 0x80;
    n >>= 7;
  }
  *ptr++ = n;
  return rb_str_new(buf, ptr - buf);
}

void
Init_zigzag(void)
{
  rb_mZigzag = rb_define_module("Zigzag");

  rb_define_module_function(rb_mZigzag, "encode_fast", zigzag_encode, 1);
}
