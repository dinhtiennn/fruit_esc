import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/common/easy.dart';

class ELearnLabelGap extends OnlyBinaryHeaderArg<ELearnLabelGap> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0x03]);
  }
}
