import 'package:birendra_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ThemeProvider starts dark, toggles, and notifies listeners', () {
    final provider = ThemeProvider();
    var notifications = 0;
    provider.addListener(() => notifications++);
    expect(provider.themeMode, ThemeMode.dark);

    provider.toggleTheme();
    expect(provider.themeMode, ThemeMode.light);
    expect(notifications, 1);

    provider.setThemeMode(ThemeMode.light);
    expect(notifications, 1);
  });
}
