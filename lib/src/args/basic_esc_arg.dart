import 'dart:typed_data';

import 'package:psdk_frame_father/father/args/arg.dart';
import 'package:psdk_frame_father/father/args/common/easy.dart';

 abstract class BasicESCArg<T extends BasicESCArg<T>> extends EasyArg<Uint8List> {
  @override
  T prepend(Arg<Uint8List> arg) {
    super.prepend(arg);
    return this as T;
  }

  @override
  T append(Arg<Uint8List> arg) {
    super.append(arg);
    return this as T;
  }

  @override
   bool newline() {
    return false;
  }
}
