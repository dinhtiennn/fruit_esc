import 'dart:typed_data';
import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';
import 'basic_esc_arg.dart';

class ELineRow extends BasicESCArg<ELineRow> {
  late int _row;

  ELineRow({
    required int row,
  }) {
    _row = row;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x1B, 0x64]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_row).clause();
  }
}
