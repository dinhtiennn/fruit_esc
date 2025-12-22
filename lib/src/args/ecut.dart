import 'dart:typed_data';
import 'package:psdk_frame_father/father/args/common/easy.dart';

class ECut extends OnlyBinaryHeaderArg<ECut> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x1d, 0x56, 0x00]);
  }
}
