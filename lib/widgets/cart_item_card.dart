import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/models/cart_item.dart';
import 'package:flutter_maestro_sample/providers/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Semantics(
        label: 'cart${cartItem.product.id}',
        child: Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.lightBlue.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(cartItem.product.imagePath),
              ),
              Column(
                children: [
                  Text(cartItem.product.name),
                  Text('${cartItem.product.price * cartItem.quantity}'),
                ],
              ),
              // add, delete button
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).addCartItem(cartItem.product);
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(cartItem.quantity.toString()),
                  TextButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeCartItem(cartItem.product);
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
