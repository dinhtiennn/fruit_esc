import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/common/easy.dart';

class EBTType extends OnlyBinaryHeaderArg<EBTType> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x1F, 0xB2, 0x10]);
  }
}
