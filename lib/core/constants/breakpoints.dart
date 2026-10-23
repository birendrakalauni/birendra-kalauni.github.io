class Breakpoints {
  Breakpoints._();

  static const double mobileMax = 640;
  static const double desktopMin = 1024;

  static bool isMobile(double width) => width < mobileMax;
  static bool isTablet(double width) => width < desktopMin;
  static bool isDesktop(double width) => width >= desktopMin;
}
