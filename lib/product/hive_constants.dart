class HiveConstants {
  static final HiveConstants _appColors = HiveConstants._internal();

  factory HiveConstants() {
    return _appColors;
  }

  HiveConstants._internal();

  static const int todoTypeId = 0;

  static const String todoBox = 'todoBox';
  static const String completedTodoBox = 'completedTodoBox';
  static const String themeBox = 'themeBox';
  static const String themeKey = 'themeKey';
}
