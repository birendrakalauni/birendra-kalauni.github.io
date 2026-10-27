import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:birendra_portfolio/app.dart';

void setViewSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('Desktop shows the full navigation bar and hero', (tester) async {
    setViewSize(tester, const Size(1280, 900));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Projects'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsNothing);
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('View Projects'), findsOneWidget);
  });

  testWidgets('About and skills content is present', (tester) async {
    setViewSize(tester, const Size(1280, 900));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Kathmandu, Nepal'), findsOneWidget);
    expect(find.text('Technical Skills'), findsOneWidget);
    expect(find.text('Programming'), findsOneWidget);
    expect(find.text('Dart, Java, SQL'), findsOneWidget);
    expect(find.text('Tools & Design'), findsOneWidget);
  });

  testWidgets('Mobile menu opens and closes after selecting an item', (
    tester,
  ) async {
    setViewSize(tester, const Size(400, 800));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Projects'), findsNothing); // menu is closed

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Projects'), findsOneWidget); // menu is open

    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();
    expect(find.text('Projects'), findsNothing); // menu closed again
  });

  // Rendering the whole page at several widths fails if any layout overflows.
  for (final width in [360.0, 640.0, 768.0, 1024.0, 1440.0]) {
    testWidgets('Page renders without overflow at ${width.toInt()}px', (
      tester,
    ) async {
      setViewSize(tester, Size(width, 900));
      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();

      expect(find.text('Flutter Developer'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
