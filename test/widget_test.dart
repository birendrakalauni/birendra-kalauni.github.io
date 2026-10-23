import 'package:birendra_portfolio/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home screen shows the name and title', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Birendra Kalauni'), findsOneWidget);
    expect(find.text('Flutter Developer'), findsOneWidget);
  });
}
