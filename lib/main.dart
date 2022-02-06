import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: palette,
      ),
      home: TabsScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.PRODUCTS_OVERVIEW: (context) => ProductsOverView(),
        AppRoutes.PRODUCT_DETAIL: (context) => ProductDetail(),
        AppRoutes.CART: (context) => Container(),
        AppRoutes.HISTORY: (context) => Container(),
      },
    );
  }
}
