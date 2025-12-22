import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/common/easy.dart';

class EEnableGray extends OnlyBinaryHeaderArg<EEnableGray> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0xBD, 0x02]);
  }
}
