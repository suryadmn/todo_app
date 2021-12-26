import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/models/item.dart';

final itemListProvider = StateNotifierProvider<ItemListNotifier, List<Item>>(
  (_) => ItemListNotifier(),
);

class ItemListNotifier extends StateNotifier<List<Item>> {
  ItemListNotifier() : super([]);

  void addItem(Item item) {
    List<Item> _item = [...state];
    _item.add(item);
    state = _item;
    //state = state..add(item);
  }

  void updateItem(Item item) {
    state = [
      for (var i in state)
        if (i.id == item.id) item else i
    ];
  }

  void deleteItem(Item item) {
    state = state..removeWhere((element) => element.id == item.id);
  }
}
