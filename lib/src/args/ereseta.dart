import 'dart:typed_data';
import 'package:psdk_frame_father/father/args/common/easy.dart';
///QR-285A特殊的重置
class EReSetA extends OnlyBinaryHeaderArg<EReSetA> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x1B, 0x40]);
  }
}
