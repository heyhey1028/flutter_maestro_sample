import 'package:flutter_maestro_sample/models/cart_item.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  List<CartItem> build() {
    return [];
  }

  int get totalPrice => state.fold(0, (previousValue, element) => previousValue + element.product.price * element.quantity);

  bool get isEmpty => state.isEmpty;

  void addCartItem(Product product) {
    final items = state.where((item) => item.product == product);
    if (items.isEmpty) {
      state = [...state, CartItem(product: product)];
      return;
    }
    final item = CartItem(product: product, quantity: items.first.quantity + 1);
    final index = state.indexWhere((item) => item.product == product);
    state[index] = item;
    state = [...state];
  }

  void removeCartItem(Product product) {
    final items = state.where((item) => item.product == product);

    if (items.isEmpty) return;

    final item = CartItem(product: product, quantity: items.first.quantity);
    final index = state.indexWhere((item) => item.product == product);

    if (item.quantity == 1) {
      state.removeAt(index);
      state = [...state];
      return;
    }
    state[index] = CartItem(product: product, quantity: item.quantity - 1);
    state = [...state];
  }
}
