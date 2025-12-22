import 'dart:typed_data';
import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'basic_esc_arg.dart';

class ELineDot extends BasicESCArg<ELineDot> {
  late int _dot;

  ELineDot({
    required int dot,
  }) {
    _dot = dot;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x1B, 0x4A]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_dot).clause();
  }
}
