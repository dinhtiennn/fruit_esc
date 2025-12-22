import 'dart:typed_data';
import 'package:psdk_frame_father/father/args/common/easy.dart';
///QR-285A特殊的改变速度
class EChangeSpeedA extends OnlyBinaryHeaderArg<EChangeSpeedA> {
  @override
  Uint8List header() {
    return Uint8List.fromList([0x1F, 0x60, 0x02, 0x02]);
  }
}
