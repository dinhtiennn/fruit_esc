import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/common/easy.dart';

class EPosition extends OnlyBinaryHeaderArg<EPosition> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x1d, 0x0c]);
  }
}
