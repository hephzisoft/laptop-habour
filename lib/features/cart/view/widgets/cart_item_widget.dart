import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/models/cart_model.dart';
import '../../../../common/services/app_utils.dart';
import '../../../../common/widgets/text_widgets.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({
    super.key,
    required this.price,
    required this.id,
    required this.quantity,
    required this.name,
    required this.image,
  });
  final double price;
  final String id;
  final int quantity;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(image);
    return Container(
      width: 330.w,
      height: 150.h,
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 5.h,
      ),
      margin: EdgeInsets.only(
        bottom: 15.h,
        left: 15.w,
        right: 15.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120.w,
            child: Image.asset(image),
          ),
          SizedBox(
            width: 160.w,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text14Normal(
                      text: name,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      wrap: true,
                      // size: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5.h),
                    child: Text14Normal(
                      text: "\$${AppUtils.formatNumberWithCommas(price)}",
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 110.w,
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      margin: EdgeInsets.only(top: 5.h),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        // color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              ref
                                  .watch(cartProviderNotifier.notifier)
                                  .addSingleItem(id);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Text14Normal(
                            text: "$quantity",
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .watch(cartProviderNotifier.notifier)
                                  .removeSingleItem(id);
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
