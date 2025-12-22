import 'dart:typed_data';
import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'basic_esc_arg.dart';

class EThickness extends BasicESCArg<EThickness> {
  late int _thickness;

  EThickness({
    required int thickness,
  }) {
    _thickness = thickness;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0x10, 0x00]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_thickness).clause();
  }
}
