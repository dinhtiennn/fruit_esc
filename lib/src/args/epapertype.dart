import 'dart:typed_data';

import 'package:psdk_frame_father/father/command/print/command_clause.dart';
import 'package:psdk_frame_father/father/command/single/binary_command.dart';

import 'basic_esc_arg.dart';

class EPaperType extends BasicESCArg<EPaperType> {
  late Type _type;

  EPaperType({
    Type type = Type.foldedBlackLabelPaper,
  }) {
    _type = type;
  }

  @override
  Uint8List header() {
    return Uint8List.fromList([0x10, 0xff, 0x10, 0x03]);
  }

  @override
  CommandClause clause() {
    return BinaryCommand(header()).appendNumber(_type.getType()).clause();
  }
}

enum Type {
  /// 折叠黑标纸
  foldedBlackLabelPaper,

  /// 连续卷筒纸
  continuousReelPaper,

  /// 不干胶缝隙纸
  noDryAdhesivePaper,

  /// 打孔纸
  holePaper,

  /// 纹身纸
  tattooPaper,

  /// 纹身纸（防皱模式）
  tattooWrinklesPaper,

  /// 透明黑标纸
  transparentBlackLabelPaper,
}

extension TypeExt on Type {
  int getType() {
    switch (this) {
      case Type.foldedBlackLabelPaper:
        return 0;
      case Type.continuousReelPaper:
        return 1;
      case Type.noDryAdhesivePaper:
        return 2;
      case Type.holePaper:
        return 3;
      case Type.tattooPaper:
        return 4;
      case Type.tattooWrinklesPaper:
        return 5;
      case Type.transparentBlackLabelPaper:
        return 6;
    }
  }
}
