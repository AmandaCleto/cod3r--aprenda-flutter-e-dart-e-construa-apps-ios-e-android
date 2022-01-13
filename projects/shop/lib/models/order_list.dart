import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/cart_list.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class OrderList with ChangeNotifier {
  final String _token;
  final String _userId;
  List<Order> _items = [];

  OrderList([
    this._token = '',
    this._userId = '',
    this._items = const [],
  ]);

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadOrders() async {
    List<Order> items = [];

    final response = await http.get(
      Uri.parse(
        '${Constants.OrdersBaseUrl}/$_userId.json?auth=$_token',
      ),
    );

    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((orderId, orderData) {
      items.add(
        Order(
          id: orderId,
          date: DateTime.parse(orderData['date']),
          total: orderData['total'],
          products: (orderData['products'] as List<dynamic>).map((item) {
            return CartItem(
              id: item['id'],
              productId: item['productId'],
              name: item['name'],
              quantity: item['quantity'],
              price: item['price'],
            );
          }).toList(),
        ),
      );

      _items = items.reversed.toList();

      notifyListeners();
    });
  }

  Future<void> addOrder(CartList cart) async {
    final dateNow = DateTime.now();

    final response = await http.post(
      Uri.parse(
        '${Constants.OrdersBaseUrl}/$_userId.json?auth=$_token',
      ),
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
