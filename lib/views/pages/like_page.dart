import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/providers/favorite.dart';
import 'package:flutter_maestro_sample/widgets/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikePage extends ConsumerWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashes = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (final dash in dashes)
              ProductCard(
                product: dash,
                navigateDisabled: true,
              ),
          ],
        ),
      ),
    );
  }
}
