import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_route_data.dart';
import 'package:flutter_maestro_sample/providers/cart.dart';
import 'package:flutter_maestro_sample/widgets/cart_item_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              for (final item in items) CartItemCard(cartItem: item),
            ],
          ),
          if (items.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    const PaymentRouteData().go(context);
                  },
                  child: const Text('BUY'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
