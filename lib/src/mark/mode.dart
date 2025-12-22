enum Mode {
  normal,
  doubleWidth,
  doubleHeight,
  doubleWidthHeight,
}

extension ModeExt on Mode {
  int getMode() {
    switch (this) {
      case Mode.normal:
        return 0;
      case Mode.doubleWidth:
        return 1;
      case Mode.doubleHeight:
        return 2;
      case Mode.doubleWidthHeight:
        return 3;
    }
  }
}
