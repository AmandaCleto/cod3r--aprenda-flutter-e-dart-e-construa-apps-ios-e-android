import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_list.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).errorColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Tem certeza?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            content: const Text('Esse produto será removido do carrinho'),
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
        );
      },
      onDismissed: (_) {
        Provider.of<CartList>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: ListTile(
          title: Text(cartItem.name),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor:
                Theme.of(context).primaryTextTheme.headline6?.color,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ),
            ),
          ),
          subtitle: Text(
              'Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
          trailing: Text(
            '${cartItem.quantity}x',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
