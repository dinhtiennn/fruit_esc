import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class EPaperTypeQ3 extends BasicESCArg<EPaperTypeQ3> {
  late TypeQ3 _type;

  EPaperTypeQ3({
    TypeQ3 type = TypeQ3.continuousReelPaper,
  }) {
    _type = type;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xff, 0x84]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_type.getType()).clause();
  }
}

enum TypeQ3 {
  /// 不干胶缝隙纸
  noDryAdhesivePaper,

  /// 透明黑标纸
  transparentBlackLabelPaper,

  /// 连续卷筒纸
  continuousReelPaper,
}

extension TypeQ3Ext on TypeQ3 {
  int getType() {
    switch (this) {
      case TypeQ3.noDryAdhesivePaper:
        return 0;
      case TypeQ3.transparentBlackLabelPaper:
        return 1;
      case TypeQ3.continuousReelPaper:
        return 2;
    }
  }
}
