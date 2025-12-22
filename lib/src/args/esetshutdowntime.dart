import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class ESetShutdownTime extends BasicESCArg<ESetShutdownTime> {
  late int _time;

  ESetShutdownTime({
    required int time,
  }) {
    _time = time;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0x12]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header())
        .appendNumber(_time ~/ 256)
        .appendNumber(_time % 256)
        .clause();
  }
}
