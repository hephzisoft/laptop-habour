import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_model.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchProductController, List<Product>>((ref) {
  return SearchProductController();
});

class SearchProductController extends StateNotifier<List<Product>> {
  SearchProductController() : super([]);

  void onSearchUser(String query, List<Product> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element.name
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toList();
      state.addAll(result);
    }
  }
}
