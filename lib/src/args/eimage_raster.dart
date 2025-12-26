import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';
import '../mark/mode.dart';

/// Print a raster image using ESC/POS `GS v 0` format.
///
/// This bypasses PNG decoding inside `psdk_imageb` completely: you provide the already
/// packed 1-bit raster bytes (top-bit packed by row).
///
/// Data layout:
/// - `data.length == byteWidth * height` where `byteWidth = ceil(width / 8)`
/// - Each bit represents a pixel (1 = black, 0 = white), MSB first in each byte.
class EImageRaster extends BasicESCArg<EImageRaster> {
  final Uint8List data;
  final int width;
  final int height;
  final Mode mode;
  final bool reverse;

  EImageRaster({
    required this.data,
    required this.width,
    required this.height,
    this.mode = Mode.normal,
    this.reverse = false,
  });

  @override
  Uint8List header() => Uint8List.fromList([0x1D, 0x76, 0x30]);

  @override
  CommandClause clause() {
    final byteWidth = (width + 7) ~/ 8;
    final expectedLen = byteWidth * height;
    if (data.length != expectedLen) {
      throw Exception(
        'Wrong raster data length: got=${data.length} expected=$expectedLen (byteWidth=$byteWidth height=$height)',
      );
    }

    Uint8List payload = data;
    if (reverse) {
      final out = Uint8List(payload.length);
      for (var i = 0; i < payload.length; i++) {
        out[i] = (~payload[i]) & 0xff;
      }
      payload = out;
    }

    return BinaryCommand(header())
        .appendNumber(mode.getMode())
        .appendNumber((byteWidth % 256))
        .appendNumber(byteWidth ~/ 256)
        .appendNumber((height % 256))
        .appendNumber(height ~/ 256)
        .appendListInt(payload)
        .clause();
  }
}
