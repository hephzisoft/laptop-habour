import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'cart_model.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
    required this.dateTime,
  });
}

class OrderNotifier extends StateNotifier<List<OrderItem>> {
  OrderNotifier() : super([]);

  void addOrder(List<CartItem> cartProducts, double total) {
    const uuid = Uuid();
    final String orderId = uuid.v4();

    var newOrder = [...state];
    newOrder.insert(
      0,
      OrderItem(
        id: orderId,
        amount: total,
        product: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    state = newOrder;
  }
}

final orderNotifierProvider =
    StateNotifierProvider<OrderNotifier, List<OrderItem>>(
        (ref) => OrderNotifier());
