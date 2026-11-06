import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:birendra_portfolio/app.dart';

void setViewSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Future<void> pumpApp(WidgetTester tester, Size size) async {
  setViewSize(tester, size);
  await tester.pumpWidget(const PortfolioApp());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Desktop shows the full navigation bar and hero', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    expect(find.text('Projects'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsNothing);
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('View Projects'), findsOneWidget);
  });

  testWidgets('About and skills content is present', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Technical Skills'), findsOneWidget);
    expect(find.text('Provider, GetX, BLoC'), findsOneWidget);
  });

  testWidgets('Projects section shows all three projects', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    expect(find.text('Featured Projects'), findsOneWidget);
    expect(find.text('rideTogether'), findsOneWidget);
    expect(find.text('Hamaro Gunaso'), findsOneWidget);
    expect(find.text('Flashcard Quiz App'), findsOneWidget);
    expect(find.text('Ongoing'), findsOneWidget);
  });

  testWidgets('Filter chips narrow the project list', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    final sqliteChip = find.widgetWithText(ChoiceChip, 'SQLite');
    await tester.ensureVisible(sqliteChip);
    await tester.tap(sqliteChip);
    await tester.pumpAndSettle();

    expect(find.text('Flashcard Quiz App'), findsOneWidget);
    expect(find.text('rideTogether'), findsNothing);

    final allChip = find.widgetWithText(ChoiceChip, 'All');
    await tester.ensureVisible(allChip);
    await tester.tap(allChip);
    await tester.pumpAndSettle();

    expect(find.text('rideTogether'), findsOneWidget);
  });

  testWidgets('Opening a project shows its detail page; back returns',
      (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    final title = find.text('rideTogether');
    await tester.ensureVisible(title);
    await tester.tap(title);
    await tester.pumpAndSettle();

    expect(find.text('Group Ride Coordination App'), findsOneWidget);
    expect(find.text('Key features'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Featured Projects'), findsOneWidget);
  });

  testWidgets('Mobile menu opens and closes after selecting an item',
      (tester) async {
    await pumpApp(tester, const Size(400, 800));

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
  for (final width in [360.0, 640.0, 768.0, 1024.0, 1200.0, 1440.0]) {
    testWidgets('Page renders without overflow at ${width.toInt()}px',
        (tester) async {
      await pumpApp(tester, Size(width, 900));

      expect(find.text('Flutter Developer'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}