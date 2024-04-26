import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/models/product_model.dart';

class ReviewForm extends ConsumerStatefulWidget {
  const ReviewForm({
    super.key,
  });

  @override
  ConsumerState<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends ConsumerState<ReviewForm> {
  late String args;
  late TextEditingController controller;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rate this product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.w,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  RatingBar.builder(
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                    onRatingUpdate: (value) {
                      rating = value;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                      controller: controller,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Comment",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 15.h,
                      ),
                    ),
                    onPressed: () {
                      ref.watch(productNotifierProvider.notifier).addRating(
                            prodId: args,
                            rating: rating,
                            comment: controller.text,
                          );

                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Add Review",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
