import 'package:birendra_portfolio/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void setViewSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('Desktop shows the full navigation bar', (tester) async {
    setViewSize(tester, Size(1280, 900));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Projects'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsNothing);
  });

  testWidgets('Mobile menu opens and closes after selecting an item', (
    tester,
  ) async {
    setViewSize(tester, const Size(400, 800));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Projects'), findsNothing);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Projects'), findsOneWidget);

    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();
    expect(find.text('Projects'), findsNothing);
  });
}
