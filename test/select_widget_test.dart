import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/select_option.dart';
import 'package:myapp/select_widget.dart';

void main() {
  testWidgets(
      'Given I have a list of options, then I display the option display text for each option',
      (WidgetTester tester) async {
    List<SelectOption> options = []
      ..add(SelectOption(name: 'one', display: 'One'))
      ..add(SelectOption(name: 'two', display: 'Two'))
      ..add(SelectOption(name: 'three', display: 'Three'));
    await tester.pumpWidget(MaterialApp(home: SelectWidget(options: options)));
    final findOne = find.text('One');
    final findTwo = find.text('Two');
    final findThree = find.text('Three');
    expect(findOne, findsOneWidget);
    expect(findTwo, findsOneWidget);
    expect(findThree, findsOneWidget);
    final findOneLower = find.text('one');
    final findTwoLower = find.text('two');
    final findThreeLower = find.text('three');
    expect(findOneLower, findsNothing);
    expect(findTwoLower, findsNothing);
    expect(findThreeLower, findsNothing);
  });

  testWidgets(
      'Given I have an empty list of options, then I display text "No options available" container',
      (WidgetTester tester) async {
    List<SelectOption> options = [];
    await tester.pumpWidget(MaterialApp(home: SelectWidget(options: options)));
    final findNoOptionsText = find.text('No options available');
    expect(findNoOptionsText, findsOneWidget);
  });

  testWidgets(
      'Given I have an null list of options, then I display text "No options available" container',
      (WidgetTester tester) async {
    List<SelectOption> options;
    await tester.pumpWidget(MaterialApp(home: SelectWidget(options: options)));
    final findNoOptionsText = find.text('No options available');
    expect(findNoOptionsText, findsOneWidget);
  });
}
