import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistItem {
  final String id;
  final String title;
  final double price;
  final String image;

  WishlistItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}

class WishlistNotifier extends StateNotifier<Map<String, WishlistItem>> {
  WishlistNotifier() : super({});

  void addItem({
    required String title,
    required double price,
    required String image,
    required String productId,
  }) {
    if (state.containsKey(productId)) {
      removeItem(productId);
    } else {
      var newWishlist = {...state};
      newWishlist.putIfAbsent(
          productId,
          () => WishlistItem(
              id: productId, title: title, price: price, image: image));

      state = newWishlist;
    }
  }

  bool isFavorited(String id) {
    return state.containsKey(id);
  }

  void removeItem(String productId) {
    var newWishlist = {...state};
    newWishlist.remove(productId);

    state = newWishlist;
  }
}

final wishlistNotifierProvider =
    StateNotifierProvider<WishlistNotifier, Map<String, WishlistItem>>((ref) {
  return WishlistNotifier();
});
