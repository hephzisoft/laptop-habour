import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/models/product_model.dart';
import '../../../common/models/search_controller.dart';
import '../../../common/widgets/product_card_widget.dart';
import 'widgets/home_drawer_widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var product = ref.watch(productNotifierProvider.notifier).products();
    var searchProduct = ref.watch(searchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop Habour"),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          }),
        ],
      ),
      endDrawer: HomeDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 40.h,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SearchBar(
                      controller: _searchController,
                      hintText: 'Search',
                      hintStyle: MaterialStateProperty.all(
                        GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      onSubmitted: (value) {
                        ref
                            .read(searchControllerProvider.notifier)
                            .onSearchUser(_searchController.text, product);
                      },
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            _searchController.clear();
                            ref
                                .read(searchControllerProvider.notifier)
                                .onSearchUser(_searchController.text, product);
                          },
                        )
                      ],
                      elevation: const MaterialStatePropertyAll(0),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 15.w,
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 10.w,
                  mainAxisExtent: 310,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, index) => searchProduct.isNotEmpty
                      ? ProductCardWidget(
                          name: searchProduct[index].name,
                          price: searchProduct[index].price,
                          id: searchProduct[index].prodId,
                          image: searchProduct[index].imageUrl,
                        )
                      : ProductCardWidget(
                          name: product[index].name,
                          price: product[index].price,
                          id: product[index].prodId,
                          image: product[index].imageUrl,
                        ),
                  childCount: searchProduct.isNotEmpty
                      ? searchProduct.length
                      : product.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
