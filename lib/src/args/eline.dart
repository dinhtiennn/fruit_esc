import 'dart:typed_data';
import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'basic_esc_arg.dart';

class ELine extends BasicESCArg<ELine> {
  late int _x;
  late int _y;

  ELine({
    required int x,
    required int y,
  }) {
    _x = x;
    _y = y;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x00, 0x01]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_x).appendNumber(_y).clause();
  }
}
