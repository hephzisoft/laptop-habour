import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/cart_model.dart';
import '../models/wishlist_model.dart';
import '../routes/routes_constant.dart';
import '../services/app_utils.dart';
import '../utils/image_constant.dart';
import 'text_widgets.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    this.name = "Apple MacBook Pro 16.2\" M2 Pro Chip - 16GB RAM - 512GB SSD",
    this.price = 2000000,
    this.id = "",
    this.image = ImageRes.defaultImg,
  });
  final String name;
  final double price;
  final String id;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isFavorited = ref.watch(wishlistNotifierProvider).containsKey(id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouteConstant.productDetails, arguments: {
          "id": id,
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
          bottom: 20.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              width: 100.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text10Normal(
              text: name,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text14Normal(
              text: '\$${AppUtils.formatNumberWithCommas(price)}',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    ref.watch(cartProviderNotifier.notifier).addItem(
                          productId: id,
                          title: name,
                          price: price,
                          image: image,
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Item added to cart"),
                        showCloseIcon: true,
                        duration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.cart,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 100),
                        content: isFavorited
                            ? const Text("Item removed from wishlist")
                            : const Text("Item added to wishlist"),
                        showCloseIcon: true,
                      ),
                    );
                    ref.watch(wishlistNotifierProvider.notifier).addItem(
                          productId: id,
                          title: name,
                          price: price,
                          image: image,
                        );
                  },
                  icon: isFavorited
                      ? const FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
