import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Tem certeza?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: const Text('Esse produto será removido da loja'),
                    actions: [
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  ),
                ).then(
                  (value) {
                    if (value ?? false) {
                      return Provider.of<ProductList>(
                        context,
                        listen: false,
                      ).removeProduct(product);
                    }
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
