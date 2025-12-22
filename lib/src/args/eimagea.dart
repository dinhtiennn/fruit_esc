import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'package:psdk_fruit_esc/psdk_fruit_esc.dart';
import 'package:psdk_imageb/psdk_imageb.dart';

import 'basic_esc_arg.dart';
///QR-285A特殊的压缩指令采用这个
class EImageA extends BasicESCArg<EImageA> {
  late Uint8List _image;
  late Mode _mode;
  late int? _threshold;
  late bool _compress;
  late bool _reverse;

  EImageA({
    required Uint8List image,
    bool compress = false,
    bool reverse = false,
    Mode mode = Mode.normal,
    int? threshold,
  }) {
    _image = image;
    _mode = mode;
    _threshold = threshold;
    _compress = compress;
    _reverse = reverse;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList(_compress ? [0x1F, 0x10] : [0x1D, 0x76, 0x30]);
  }

  @override
  CommandClause clause() {
    var processer = Pbita(
      command: 'esc',
      threshold: _threshold,
      compress: _compress,
      reverse: _reverse,
    );
    var info = processer.processWithBytes(Uint8List.fromList(_image));
    var fimage = info.result;
    if (fimage == null) {
      throw Exception('Wrong image data');
    }
    int width = fimage.width;
    int height = fimage.height;

    int byteWidth;
    if (width % 8 != 0) {
      byteWidth = (width / 8 + 1).toInt();
    } else {
      byteWidth = width ~/ 8;
    }

    if (_compress) {
      return BinaryCommand(header())
          .appendNumber((byteWidth ~/ 256))
          .appendNumber(byteWidth % 256)
          .appendNumber((height ~/ 256))
          .appendNumber(height % 256)
          .appendNumber((fimage.data.length) >> 24 & 0xff)
          .appendNumber((fimage.data.length) >> 16 & 0xff)
          .appendNumber((fimage.data.length) >> 8 & 0xff)
          .appendNumber((fimage.data.length) & 0xff)
          .appendListInt(fimage.data)
          .clause();
    }

    return BinaryCommand(header())
        .appendNumber(_mode.getMode())
        .appendNumber((byteWidth % 256))
        .appendNumber(byteWidth ~/ 256)
        .appendNumber((height % 256))
        .appendNumber(height ~/ 256)
        .appendListInt(fimage.data)
        .clause();
  }
}

