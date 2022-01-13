import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shop,
              color: Colors.white,
            ),
            title: const Text(
              'Loja',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.white,
            ),
            title: const Text(
              'Pedidos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: const Text(
              'Produtos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PRODUCTS,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME,
              );
            },
          ),
        ],
      ),
    );
  }
}
