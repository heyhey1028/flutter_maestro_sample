import 'package:flutter_maestro_sample/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<Product> build() {
    return [];
  }

  void addCart(Product product) {
    state.add(product);
  }
}
