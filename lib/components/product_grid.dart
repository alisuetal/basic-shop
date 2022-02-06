import 'package:flutter/Material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool onlyFavorites;
  const ProductGrid({Key? key, required this.onlyFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts;
    if (onlyFavorites) {
      loadedProducts =
          provider.items.where((e) => e.isFavorite == true).toList();
    } else {
      loadedProducts = provider.items;
    }

    return loadedProducts.isEmpty
        ? SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Nothing here yet. :(",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Mirage",
                      color: Colors.black26),
                ),
              ],
            ),
          )
        : MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: loadedProducts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: loadedProducts[index],
              child: const ProductWidget(),
            ),
          );
  }
}
