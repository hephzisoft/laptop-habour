import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/models/order_model.dart';
import '../../../common/services/app_utils.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({super.key, required this.orderItem});

  final OrderItem orderItem;
//
  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
                '\$${AppUtils.formatNumberWithCommas(widget.orderItem.amount)}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              height: min(widget.orderItem.product.length * 20.0 + 40, 100),
              child: ListView(
                  children: widget.orderItem.product
                      .map(
                        (prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${prod.quantity}x \$${AppUtils.formatNumberWithCommas(prod.price)}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                      .toList()),
            )
        ],
      ),
    );
  }
}
