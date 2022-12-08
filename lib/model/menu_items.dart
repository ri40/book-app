import 'package:flutter/material.dart';

import '../Model/modelMenu_item.dart';

class MenuItems {
  static const List<MenuItemPoup> menuItems = [
    itemUpdate,
    itemDelete,
  ];

  static const List<MenuItemPoup> menuItemsUser = [
    addToCart,
    seeSimilaritems,
    itemDelete,
  ];

  static const itemUpdate =
      MenuItemPoup(icon: Icons.edit, text: 'Edit', color: Colors.black);

  static const itemDelete = MenuItemPoup(
      icon: Icons.delete_forever_outlined, text: 'Delete', color: Colors.red);

  static const addToCart = MenuItemPoup(
      icon: Icons.shopping_cart_outlined,
      text: 'Add To Cart',
      color: Colors.black);

  static const seeSimilaritems = MenuItemPoup(
      icon: Icons.search, text: 'See Similar item', color: Colors.black);
}
