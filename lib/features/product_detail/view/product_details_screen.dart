import "package:flutter/material.dart";
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:laptop_habour/common/models/wishlist_model.dart";

import "../../../common/models/cart_model.dart";
import "../../../common/models/product_model.dart";
import "../../../common/routes/routes_constant.dart";
import "../../../common/services/app_utils.dart";
import "../../../common/widgets/app_button_widgets.dart";
import "../../../common/widgets/text_widgets.dart";

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  late String args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var product =
        ref.read(productNotifierProvider.notifier).getProductById(args);
    var isFavorited =
        ref.watch(wishlistNotifierProvider).containsKey(product.prodId);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 15.w,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      child: Image.asset(
                        product.imageUrl,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text16Normal(
                              text: product.name,
                              fontWeight: FontWeight.bold,
                            ),
                            // add to wishlist
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(milliseconds: 100),
                                    content: isFavorited
                                        ? const Text(
                                            "Item removed from wishlist")
                                        : const Text("Item added to wishlist"),
                                    showCloseIcon: true,
                                  ),
                                );
                                ref
                                    .watch(wishlistNotifierProvider.notifier)
                                    .addItem(
                                      productId: product.prodId,
                                      title: product.name,
                                      price: product.price,
                                      image: product.imageUrl,
                                    );
                              },
                              icon: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 27,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Text14Normal(
                            text: product.description,
                            wrap: true,
                            color: Colors.white,
                            // size: 13,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text16Normal(
                              text:
                                  "\$${AppUtils.formatNumberWithCommas(product.price)}",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            AppButton(
                              buttonName: 'Add to Cart',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 100),
                                    content: Text("Item added to cart"),
                                    showCloseIcon: true,
                                  ),
                                );

                                ref
                                    .watch(cartProviderNotifier.notifier)
                                    .addItem(
                                      productId: product.prodId,
                                      title: product.name,
                                      price: product.price,
                                      image: product.imageUrl,
                                    );
                              },
                            )
                          ],
                        ),

                        // Add reviews
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text16Normal(
                                text: "Reviews",
                              ),
                            ),
                            TextButton(
                              child: Text(
                                "Add review",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AppRouteConstant.productReview,
                                    arguments: {"id": args});
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: product.reviews!.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 15.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text16Normal(
                            text: product.reviews![index]["name"],
                            fontWeight: FontWeight.bold,
                          ),
                          RatingBarIndicator(
                            rating: double.parse(
                                product.reviews![index]["rating"].toString()),
                            itemSize: 25.w,
                            itemBuilder: (_, index) => const Icon(Icons.star),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: double.infinity,
                        child: Text14Normal(
                          wrap: true,
                          text: product.reviews![index]["comment"],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
