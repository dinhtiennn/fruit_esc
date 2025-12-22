import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class ESetCurrentTime extends BasicESCArg<ESetCurrentTime> {
  late int _hour;
  late int _minute;
  late int _second;

  ESetCurrentTime({
    required int hour,
    required int minute,
    required int second,
  }) {
    _hour = hour;
    _minute = minute;
    _second = second;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xFF, 0xB0, 0x01, 0x01]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header())
        .appendNumber(_hour)
        .appendNumber(_minute)
        .appendNumber(_second)
        .clause();
  }
}
