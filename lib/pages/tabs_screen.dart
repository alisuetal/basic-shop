// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shop/components/navigation_bar_icons.dart';
import 'package:shop/pages/products_overview.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late final List<Widget> _screens = [
    ProductsOverView(),
    ProductsOverView(),
    ProductsOverView(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: _screens[_selectedScreenIndex],
          ),
          Container(
            height: 74,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarIcon(
                      icon: Icons.workspaces_filled,
                      inactiveIcon: Icons.workspaces_outline,
                      label: "Products",
                      labelOnActive: true,
                      darkMode: false,
                      active: (_selectedScreenIndex == 0),
                      onClick: () => _selectScreen(0),
                    ),
                    NavBarIcon(
                      icon: Icons.shopping_cart,
                      inactiveIcon: Icons.shopping_cart_outlined,
                      label: "Cart",
                      labelOnActive: true,
                      darkMode: false,
                      active: (_selectedScreenIndex == 1),
                      onClick: () => _selectScreen(1),
                    ),
                    NavBarIcon(
                      icon: Icons.history_rounded,
                      inactiveIcon: Icons.history_rounded,
                      label: "History",
                      labelOnActive: true,
                      darkMode: false,
                      active: (_selectedScreenIndex == 2),
                      onClick: () => _selectScreen(2),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
