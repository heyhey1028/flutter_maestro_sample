import 'package:flutter_maestro_sample/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite.g.dart';

@riverpod
class Favorite extends _$Favorite {
  @override
  Set<Product> build() {
    return {};
  }

  bool isSelected(Product product) => state.contains(product);

  void tapFavorite(Product product) {
    if (state.contains(product)) {
      removeFromFav(product);
    } else {
      addToFav(product);
    }
  }

  void addToFav(Product product) {
    state.add(product);
    state = {...state};
  }

  void removeFromFav(Product product) {
    state.remove(product);
    state = {...state};
  }
}
