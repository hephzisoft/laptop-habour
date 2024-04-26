import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/models/order_model.dart';
import 'order_item_widget.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var orders = ref.watch(orderNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, index) => OrderItemWidget(
          orderItem: orders[index],
        ),
      ),
    );
  }
}
