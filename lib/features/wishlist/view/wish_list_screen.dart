import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/wishlist_model.dart';
import '../../../common/widgets/product_card_widget.dart';
import '../../../common/widgets/text_widgets.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var wishlist = ref.watch(wishlistNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        child: SafeArea(
          child: wishlist.isEmpty
              ? const Center(
                  child: Text16Normal(
                    text: "No item added to wishlist",
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 310,
                  ),
                  itemCount: wishlist.length,
                  itemBuilder: (_, index) => ProductCardWidget(
                    id: wishlist.keys.toList()[index],
                    price: wishlist.values.toList()[index].price,
                    name: wishlist.values.toList()[index].title,
                    image: wishlist.values.toList()[index].image,
                  ),
                ),
        ),
      ),
    );
  }
}
