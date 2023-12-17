import 'package:flutter_maestro_sample/models/product.dart';

class CartItem {
  CartItem({
    this.quantity = 1,
    required this.product,
  });

  final int quantity;
  final Product product;
}
