import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Hero(
                  tag: product.tag,
                  child: Image.asset(product.imagePath),
                ),
                Text(product.name),
                Text(product.description),
                Text('${product.price}')
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
