import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _url =
      'https://shop-cod3r-7b58c-default-rtdb.firebaseio.com/products.json';
  final List<Product> _items = [];

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProduct() async {
    _items.clear();

    final response = await http.get(Uri.parse(_url));

    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((productId, productData) {
      _items.add(Product(
        id: productId,
        name: productData['name'],
        imageUrl: productData['imageUrl'],
        description: productData['description'],
        price: productData['price'],
        isFavorite: productData['isFavorite'],
      ));
    });

    notifyListeners();
  }

  Future<void> saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];

    _items.add(Product(
      id: id,
      name: product.name,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
      isFavorite: product.isFavorite,
    ));

    notifyListeners();
  }

  Future<void> updateProduct(Product product) {
    int index = _items.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }

    return Future.value();
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      _items.removeWhere((item) => item.id == product.id);
      notifyListeners();
    }
  }
}
