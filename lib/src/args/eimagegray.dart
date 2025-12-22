import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'package:psdk_imageb/psdk_imageb.dart';

import 'basic_esc_arg.dart';

class EImageGray extends BasicESCArg<EImageGray> {
  late Uint8List _image;
  late bool _compress;
  late bool _reverse;

  EImageGray({
    required Uint8List image,
    bool compress = false,
    bool reverse = false,
  }) {
    _image = image;
    _compress = compress;
    _reverse = reverse;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x1D, 0x76, 0x30, 0x00]);
  }

  @override
  CommandClause clause() {
    var processer = Pbita(
      command: 'esc',
      compress: _compress,
      reverse: _reverse,
      gray: true
    );
    var info = processer.processWithBytes(Uint8List.fromList(_image));
    var fimage = info.result;
    if (fimage == null) {
      throw Exception('Wrong image data');
    }
    int width = fimage.width;
    int height = fimage.height;

    return BinaryCommand(header())
        .appendNumber((width % 256))
        .appendNumber(width ~/ 256)
        .appendNumber((height % 256))
        .appendNumber(height ~/ 256)
        .appendListInt(fimage.data)
        .clause();
  }
}

