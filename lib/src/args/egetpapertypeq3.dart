import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/common/easy.dart';

class EGetPaperTypeQ3 extends OnlyBinaryHeaderArg<EGetPaperTypeQ3> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xff, 0x85]);
  }
}
