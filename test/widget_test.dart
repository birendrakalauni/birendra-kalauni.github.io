import 'package:birendra_portfolio/core/constants/app_info.dart';
import 'package:birendra_portfolio/core/routing/app_router.dart';
import 'package:birendra_portfolio/widgets/reveal.dart';
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

  testWidgets('Opening a project shows its detail page; back returns', (
    tester,
  ) async {
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

  testWidgets('Mobile menu opens and closes after selecting an item', (
    tester,
  ) async {
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

  testWidgets('Education, leadership and training are shown', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    expect(find.text('Education'), findsOneWidget);
    expect(find.text('Leadership Experience'), findsOneWidget);
    expect(find.text('Training'), findsOneWidget);
    expect(find.text('Technical Lead'), findsOneWidget);
    expect(find.text('Executive Member'), findsOneWidget);
    expect(find.text('Flutter Framework Training'), findsOneWidget);
    expect(find.text('July 2026 – Oct 2026'), findsOneWidget);
  });

  testWidgets('Contact section and footer show the details', (tester) async {
    await pumpApp(tester, const Size(1280, 900));

    expect(find.text('Get In Touch'), findsOneWidget);
    expect(find.text(AppInfo.email), findsWidgets); // About and Contact
    expect(find.text(AppInfo.phone), findsWidgets);
    expect(find.text('Send an Email'), findsOneWidget);
    expect(find.textContaining('All rights reserved'), findsOneWidget);
    expect(find.byTooltip('Back to top'), findsOneWidget);
  });

  testWidgets('Page survives 1.5x text scaling without overflow', (
    tester,
  ) async {
    setViewSize(tester, const Size(390, 900));
    tester.platformDispatcher.textScaleFactorTestValue = 1.5;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('Reveal fades content in once it scrolls into view', (
    tester,
  ) async {
    setViewSize(tester, const Size(800, 600));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 1200),
                Reveal(child: Text('Revealed')),
                SizedBox(height: 600),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final opacity = find.descendant(
      of: find.byType(Reveal),
      matching: find.byType(AnimatedOpacity),
    );
    expect(tester.widget<AnimatedOpacity>(opacity).opacity, 0);

    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -900),
    );
    await tester.pumpAndSettle();

    expect(tester.widget<AnimatedOpacity>(opacity).opacity, 1);
  });

  testWidgets('A project URL opened directly shows its detail page', (
    tester,
  ) async {
    addTearDown(() => appRouter.go('/')); // the router is shared by all tests
    await pumpApp(tester, const Size(1280, 900));

    appRouter.go('/projects/flashcard-quiz');
    await tester.pumpAndSettle();

    expect(find.text('Offline Flashcard App'), findsOneWidget);
  });

  testWidgets('Back from a directly opened project goes to the home page', (
    tester,
  ) async {
    addTearDown(() => appRouter.go('/'));
    await pumpApp(tester, const Size(1280, 900));

    appRouter.go('/projects/ride-together');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Featured Projects'), findsOneWidget);
  });

  testWidgets('Unknown URLs show the not-found page', (tester) async {
    addTearDown(() => appRouter.go('/'));
    await pumpApp(tester, const Size(1280, 900));

    appRouter.go('/projects/does-not-exist');
    await tester.pumpAndSettle();
    expect(find.text('Page not found'), findsOneWidget);

    appRouter.go('/nonsense');
    await tester.pumpAndSettle();
    expect(find.text('Page not found'), findsOneWidget);
  });

  // Rendering the whole page at several widths fails if any layout overflows.
  for (final width in [320.0, 360.0, 640.0, 768.0, 1024.0, 1200.0, 1440.0]) {
    testWidgets('Page renders without overflow at ${width.toInt()}px', (
      tester,
    ) async {
      await pumpApp(tester, Size(width, 900));

      expect(find.text('Flutter Developer'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
