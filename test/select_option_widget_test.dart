import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/async_service.dart';
import 'package:myapp/select_option.dart';
import 'package:myapp/select_option_widget.dart';

class MockClient extends Mock implements AsyncService {}

void main() {
  testWidgets('Given the initial state, I should display nothing selected',
      (WidgetTester tester) async {
    final client = MockClient();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Center(child: SelectOptionWidget(asyncService: client)))));
    final findNothingSelectedText = find.text('Nothing Selected.');
    expect(findNothingSelectedText, findsOneWidget);
  });

  testWidgets(
      'Given the initial state, ' +
          'when I open the select I should open the other widget ' +
          'and when click on an item the parent is updated',
      (WidgetTester tester) async {
    final client = MockClient();
    List<SelectOption> options = []
      ..add(SelectOption(name: 'one', display: 'One'))
      ..add(SelectOption(name: 'two', display: 'Two'))
      ..add(SelectOption(name: 'three', display: 'Three'));
    when(client.getOptions()).thenAnswer((_) async => options);

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Center(child: SelectOptionWidget(asyncService: client)))));
    final findNothingSelectedText = find.text('Nothing Selected.');
    expect(findNothingSelectedText, findsOneWidget);
    await tester.tap(find.text('Nothing Selected.'));

    // Rebuild the widget after the state has changed.
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text('One'), findsOneWidget);
    await tester.tap(find.text('One'));
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text('One was selected'), findsOneWidget);
  });
}
