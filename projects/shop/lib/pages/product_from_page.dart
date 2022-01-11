import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';

class ProductFromPage extends StatelessWidget {
  const ProductFromPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    final _priceFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                  fillColor: Colors.white,
                  filled: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                  fillColor: Colors.white,
                  filled: true,
                ),
                focusNode: _priceFocus,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
