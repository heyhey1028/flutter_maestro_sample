import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_route_data.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:flutter_maestro_sample/providers/favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    required this.product,
    this.navigateDisabled = false,
    super.key,
  });

  final Product product;
  final bool navigateDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(favoriteProvider).contains(product);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              if (navigateDisabled) return;
              DetailRouteData($extra: product).go(context);
            },
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Hero(
                    tag: product.tag,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(product.imagePath),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    product.name,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${product.price}',
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size(100, 35),
                    ),
                    onPressed: () {},
                    child: const Text('add'),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton.outlined(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () {
                ref.read(favoriteProvider.notifier).tapFavorite(product);
              },
              icon: Icon(
                isSelected ? Icons.favorite : Icons.favorite_border,
                color: isSelected ? Colors.blue : Colors.blueGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
