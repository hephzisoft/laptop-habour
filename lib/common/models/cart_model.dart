import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class CartNotifier extends StateNotifier<Map<String, CartItem>> {
  CartNotifier() : super({});

  int get itemCount {
    return state.length;
  }

  double get totalAmount {
    var total = 0.0;

    state.forEach((key, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    // state.removeWhere((key, cartItem) =>
    //    cartItem.id == id); // You can you this and also use this.

    state.remove(productId); // You  can also use this.
  }

  void removeSingleItem(String productId) {
    if (!state.containsKey(productId)) {
      return;
    }
    if (state[productId]!.quantity > 1) {
      final updatedMap = {...state};
      updatedMap.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price,
            image: existingCartItem.image),
      );
      state = updatedMap;
    } else {
      state.remove(productId);
    }
  }

  void addSingleItem(String productId) {
    if (!state.containsKey(productId)) {
      return;
    }

    if (state[productId]!.quantity >= 0) {
      final updatedMap = {...state}; // Create a new map with spread operator
      updatedMap.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity + 1,
        ),
      );
      state = updatedMap;
    }
  }

  void clearCart() {
    state = {};
  }

  void addItem({required String productId, required String title, required double price, required String image}) {
    if (state.containsKey(productId)) {
      // change Quantity
      state.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
          image: existingCartItem.image,
        ),
      );
    } else {
      state.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price, image: image,
        ),
      );
    }
  }
}

final cartProviderNotifier =
    StateNotifierProvider<CartNotifier, Map<String, CartItem>>(
        (ref) => CartNotifier());
