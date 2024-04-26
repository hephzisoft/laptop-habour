import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global.dart';
import '../utils/image_constant.dart';

class Product {
  final String prodId;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final List<Map<String, dynamic>>? reviews;

  Product(
      {required this.prodId,
      required this.description,
      required this.price,
      required this.name,
      required this.imageUrl,
      this.reviews});
}

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  final List<Product> _products = [
    Product(
      prodId: 'lap001',
      name: 'Dell XPS 13',
      price: 1299.99,
      description: 'Powerful and sleek ultrabook with a stunning display.',
      imageUrl: ImageRes.dell,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap002',
      name: 'Apple MacBook Pro',
      price: 1799.00,
      description:
          'High-performance laptop with a Retina display and powerful processors.',
      imageUrl: ImageRes.macbook,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap003',
      name: 'ASUS ZenBook Pro Duo',
      price: 2499.99,
      description: 'Innovative dual-screen laptop for ultimate productivity.',
      imageUrl: ImageRes.asus,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap004',
      name: 'HP Spectre x360',
      price: 1399.99,
      description:
          'Versatile 2-in-1 laptop with a stunning design and pen support.',
      imageUrl: ImageRes.hp,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap005',
      name: 'Acer Predator Helios 300',
      price: 1599.00,
      description: 'Powerful gaming laptop with a high-refresh-rate display.',
      imageUrl: ImageRes.hp,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap006',
      name: 'Lenovo ThinkPad X1 Extreme',
      price: 2199.00,
      description:
          'High-performance business laptop with top-of-the-line components.',
      imageUrl: ImageRes.lenovo,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap007',
      name: 'Microsoft Surface Laptop 4',
      price: 1299.00,
      description:
          'Sleek and powerful laptop with a stunning PixelSense display.',
      imageUrl: ImageRes.microsoft,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap008',
      name: 'Razer Blade 15',
      price: 2499.99,
      description: 'Powerful and portable gaming laptop with a sleek design.',
      imageUrl: ImageRes.acerPredator,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap009',
      name: 'ASUS VivoBook S15',
      price: 799.99,
      description: 'Affordable and lightweight laptop with a slim design.',
      imageUrl: ImageRes.asus,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap010',
      name: 'LG Gram 17',
      price: 1699.99,
      description:
          'Lightweight and ultra-portable laptop with a large display.',
      imageUrl: ImageRes.lg,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap011',
      name: 'Alienware m15 R4',
      price: 2099.99,
      description:
          'Powerful and sleek gaming laptop with advanced cooling system.',
      imageUrl: ImageRes.dell,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap012',
      name: 'ASUS ROG Zephyrus G14',
      price: 1449.99,
      description:
          'Compact and powerful gaming laptop with high-end components.',
      imageUrl: ImageRes.asus,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap013',
      name: 'Lenovo Yoga C940',
      price: 1499.99,
      description:
          'Premium 2-in-1 laptop with a stunning design and stylus support.',
      imageUrl: ImageRes.lenovo,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap014',
      name: 'Acer Swift 3',
      price: 699.99,
      description: 'Affordable and lightweight laptop with decent performance.',
      imageUrl: ImageRes.acerPredator,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap015',
      name: 'Dell XPS 15',
      price: 1799.99,
      description: 'Powerful multimedia laptop with a stunning 4K display.',
      imageUrl: ImageRes.dell,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap016',
      name: 'HP Omen 15',
      price: 1399.99,
      description: 'Affordable and capable gaming laptop with a sleek design.',
      imageUrl: ImageRes.hp,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap017',
      name: 'Lenovo ThinkPad X1 Yoga',
      price: 1799.00,
      description:
          'Premium 2-in-1 business laptop with a durable design and long battery life.',
      imageUrl: ImageRes.lenovo,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap018',
      name: 'Acer Nitro 5',
      price: 999.99,
      description: 'Budget-friendly gaming laptop with decent performance.',
      imageUrl: ImageRes.acerPredator,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap020',
      name: 'MSI GS66 Stealth',
      price: 2199.99,
      description: 'Powerful and portable gaming laptop with a sleek design.',
      imageUrl: ImageRes.acerPredator,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap021',
      name: 'Dell G7 15',
      price: 1099.99,
      description: 'Budget-friendly gaming laptop with decent performance.',
      imageUrl: ImageRes.dell,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap022',
      name: 'Lenovo Yoga C630',
      price: 999.99,
      description:
          'Affordable 2-in-1 laptop with a sleek design and long battery life.',
      imageUrl: ImageRes.lenovo,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
    Product(
      prodId: 'lap023',
      name: 'ASUS ZenBook Flip S',
      price: 1399.99,
      description:
          'Premium 2-in-1 laptop with a stunning design and high-end components.',
      imageUrl: ImageRes.asus,
      reviews: [
        {
          'name': 'Joshua',
          'rating': 4,
          'comment': 'Very good product',
        },
        {
          'name': 'Hephzibah',
          'rating': 3.0,
          'comment': 'Good but i could only use the product for about 2 months',
        },
        {
          'name': 'Kehinde',
          'rating': 5,
          'comment': 'I have been using the product for a very long time now',
        },
      ],
    ),
  ];

  List<Product> products() {
    return [..._products];
  }

  Product getProductById(String id) {
    return _products.firstWhere((product) => product.prodId == id);
  }

  List<Product> searchBooks(String query) {
    return _products
        .where(
          (product) => product.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
  }

  void addRating({
    required String prodId,
    required double rating,
    required String comment,
  }) {
    var product = _products.firstWhere((product) => product.prodId == prodId);
    print(product.name);
    var username = Global.storageService.getUserProfile().username;

    product.reviews?.add({
      'name': username.toString(),
      'rating': rating,
      'comment': comment,
    });
  }
}

var productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) => ProductNotifier(),
);
