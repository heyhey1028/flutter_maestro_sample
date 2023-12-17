import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:flutter_maestro_sample/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: ProductCategory.values.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dashes = Product.all;
    const categories = ProductCategory.values;

    return Semantics(
      label: 'home page',
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  for (final category in categories)
                    Tab(
                      text: category.name,
                    ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (final category in categories)
                      GridView.count(
                        crossAxisCount: 2,
                        children: [
                          for (final dash in dashes)
                            if (dash.category == category) ProductCard(product: dash),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
