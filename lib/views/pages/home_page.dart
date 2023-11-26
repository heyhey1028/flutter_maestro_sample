import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_router.dart';
import 'package:flutter_maestro_sample/models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashes = [
      Product.bunny,
      Product.coffee,
      Product.pencil,
      Product.professor,
      Product.superman,
      Product.fire,
      Product.guiter,
      Product.gym,
    ];

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          for (final dash in dashes) ProductCard(product: dash),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              // context.goNamed('detail', extra: product);
              // DetailRouteData($extra: product).go(context);
            },
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Hero(
                    tag: product.tag,
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.cover,
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
                    child: const Text('buy'),
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
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
