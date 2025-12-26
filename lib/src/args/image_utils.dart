import 'dart:typed_data';

int popcount8(int v) {
  v &= 0xff;
  v = v - ((v >> 1) & 0x55);
  v = (v & 0x33) + ((v >> 2) & 0x33);
  return (((v + (v >> 4)) & 0x0f) * 0x01) & 0xff;
}

double estimateBlackRatio(Uint8List data, int width, int height) {
  // data is top-bit packed: 1 bit == 1 pixel.
  // Note: last byte in each row may contain padding bits; this is an estimate.
  if (width <= 0 || height <= 0) return 0;
  final totalPixels = width * height;
  var black = 0;
  for (final b in data) {
    black += popcount8(b);
  }
  return black / totalPixels;
}


