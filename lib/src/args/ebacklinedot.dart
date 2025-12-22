import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class EBackLineDot extends BasicESCArg<EBackLineDot> {
  late int _dot;

  EBackLineDot({
    required int dot,
  }) {
    _dot = dot;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0x81]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_dot).clause();
  }
}
