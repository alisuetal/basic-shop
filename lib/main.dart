import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/product_add_cart.dart';
import 'package:shop/pages/product_detail.dart';
import 'package:shop/pages/products_overview.dart';
import 'package:shop/pages/tabs_screen.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/palette.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),
        systemNavigationBarColor: Color(0xFFEBEBEB),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart())
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: palette,
        ),
        home: const TabsScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.PRODUCTS_OVERVIEW: (context) =>
              const ProductsOverView(onlyFavorites: false),
          AppRoutes.PRODUCT_DETAIL: (context) => const ProductDetail(),
          AppRoutes.CART: (context) => Container(),
          AppRoutes.HISTORY: (context) => Container(),
          AppRoutes.ADD_TO_CART: (context) => CartAddProduct(),
        },
      ),
    );
  }
}
