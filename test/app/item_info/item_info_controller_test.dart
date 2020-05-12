import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:book_finder/app/item_info/item_info_controller.dart';
import 'package:book_finder/app/item_info/item_info_module.dart';

void main() {
  initModule(ItemInfoModule());
  ItemInfoController iteminfo;

  setUp(() {
    iteminfo = ItemInfoModule.to.get<ItemInfoController>();
  });

  group('ItemInfoController Test', () {
    test("First Test", () {
      expect(iteminfo, isInstanceOf<ItemInfoController>());
    });

    test("Set Value", () {
      expect(iteminfo.value, equals(0));
      iteminfo.increment();
      expect(iteminfo.value, equals(1));
    });
  });
}
