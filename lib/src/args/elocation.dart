import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class ELocation extends BasicESCArg<ELocation> {
  late int _location;

  ELocation({
    required int location,
  }) {
    _location = location;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x1b, 0x61]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_location).clause();
  }
}
