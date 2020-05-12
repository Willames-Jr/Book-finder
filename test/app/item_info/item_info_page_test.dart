import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:book_finder/app/item_info/item_info_page.dart';

main() {
  testWidgets('ItemInfoPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ItemInfoPage(title: 'ItemInfo')));
    final titleFinder = find.text('ItemInfo');
    expect(titleFinder, findsOneWidget);
  });
}
