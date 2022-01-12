import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    final dateNow = DateTime.now();

    final response = await http.post(
      Uri.parse('${Constants.OrdersBaseUrl}.json'),
      body: jsonEncode({
        'id': Random().nextDouble().toString(),
        'total': cart.totalAmount,
        'date': dateNow.toIso8601String(),
        'products': cart.items.values
            .map(
              (cartItem) => {
                'id': cartItem.id,
                'productId': cartItem.productId,
                'name': cartItem.name,
                'quantity': cartItem.quantity,
                'price': cartItem.price,
              },
            )
            .toList(),
      }),
    );

    final id = jsonDecode(response.body)['name'];

    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        date: dateNow,
        products: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
