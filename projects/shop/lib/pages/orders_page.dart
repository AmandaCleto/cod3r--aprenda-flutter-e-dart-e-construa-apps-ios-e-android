import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.error != null) {
            return const Center(
              child: Text('Ocorreu um erro!',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => _refreshOrders(context),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Consumer<OrderList>(
                  builder: (context, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (context, index) => OrderWidget(
                      order: orders.items[index],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
