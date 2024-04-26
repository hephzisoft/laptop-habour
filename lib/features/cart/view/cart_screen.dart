import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/cart_model.dart';
import '../../../common/models/order_model.dart';
import '../../../common/services/app_utils.dart';
import '../../../common/services/notification_service.dart';
import '../../../common/widgets/app_button_widgets.dart';
import '../../../common/widgets/text_widgets.dart';
import 'widgets/cart_item_widget.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.watch(cartProviderNotifier);
    var cartNotifier = ref.watch(cartProviderNotifier.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  width: 320.w,
                  margin: EdgeInsets.only(
                    bottom: 30.h,
                    left: 15.w,
                    right: 15.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text14Normal(
                        color: Colors.black,
                        text: '${cartNotifier.itemCount} total item(s) in cart',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text14Normal(
                        text:
                            "Total Amount: \$${AppUtils.formatNumberWithCommas(cartNotifier.totalAmount)}",
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppButton(
                        isLogin: true,
                        buttonName: 'Order',
                        onPressed: () {
                          ref.watch(orderNotifierProvider.notifier).addOrder(
                              cart.values.toList(), cartNotifier.totalAmount);
                          NotificationService().showNotification(
                            title: "Order has been placed",
                            body:
                                "The product ordered has been placed. You will recieve a mail to confirm the order",
                          );
                          cartNotifier.clearCart();
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => CartItemWidget(
                    id: cart.keys.toList()[index],
                    price: cart.values.toList()[index].price,
                    quantity: cart.values.toList()[index].quantity,
                    name: cart.values.toList()[index].title,
                    image: cart.values.toList()[index].image,
                  ),
                  childCount: cart.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
