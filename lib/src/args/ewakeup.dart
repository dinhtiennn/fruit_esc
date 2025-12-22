import 'dart:typed_data';
import 'package:psdk_frame_father/father/args/common/easy.dart';

class EWakeup extends OnlyBinaryHeaderArg<EWakeup> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00]);
  }
}
