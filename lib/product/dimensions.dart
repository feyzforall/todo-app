class Dimensions {
  static final Dimensions _appColors = Dimensions._internal();

  factory Dimensions() {
    return _appColors;
  }

  Dimensions._internal();

  static const double pagePadding = 24.0;
}
