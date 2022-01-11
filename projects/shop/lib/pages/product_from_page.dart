import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductFromPage extends StatefulWidget {
  const ProductFromPage({Key? key}) : super(key: key);

  @override
  State<ProductFromPage> createState() => _ProductFromPageState();
}

class _ProductFromPageState extends State<ProductFromPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  bool isValidUrl = false;
  bool endsWithFile = false;

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(_updateImage);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();

    _imageUrlFocus.removeListener(_updateImage);
    _imageUrlFocus.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final argument = ModalRoute.of(context)?.settings.arguments;

      if (argument != null) {
        final product = argument as Product;

        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['description'] = product.description;
        _formData['price'] = product.price;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  void _updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    inspect(url);
    isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');

    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(
      context,
      listen: false,
    ).saveProduct(_formData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['name']?.toString(),
                decoration: const InputDecoration(
                  labelText: "Nome",
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: TextStyle(
                    color: Color.fromRGBO(255, 153, 135, 1),
                  ),
                ),
                enableInteractiveSelection: true,
                cursorColor: Theme.of(context).primaryColor,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (_name) {
                  final name = _name ?? '';

                  if (name.trim().isEmpty) {
                    return 'O nome é obrigatório.';
                  }

                  if (name.trim().length < 3) {
                    return 'O nome precisa ter no mínimo 3 letras.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['price']?.toString(),
                decoration: const InputDecoration(
                  labelText: "Preço",
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: TextStyle(
                    color: Color.fromRGBO(255, 153, 135, 1),
                  ),
                ),
                cursorColor: Colors.white,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                focusNode: _priceFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                onSaved: (price) =>
                    _formData['price'] = double.parse(price ?? '0'),
                validator: (_price) {
                  final priceString = _price ?? '';
                  final price = double.tryParse(priceString) ?? -1;

                  if (price <= 0) {
                    return 'Informe um preço válido.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['description']?.toString(),
                decoration: const InputDecoration(
                  labelText: "Descrição",
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: TextStyle(
                    color: Color.fromRGBO(255, 153, 135, 1),
                  ),
                ),
                maxLines: 3,
                cursorColor: Colors.white,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocus,
                onSaved: (description) =>
                    _formData['description'] = description ?? '',
                validator: (_description) {
                  final description = _description ?? '';

                  if (description.trim().isEmpty) {
                    return 'Descrição é obrigatória.';
                  }

                  if (description.trim().length < 10) {
                    return 'Descrição precisa no mínimo de 10 letras.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "URL da Imagem",
                        fillColor: Colors.white,
                        filled: true,
                        errorStyle: TextStyle(
                          color: Color.fromRGBO(255, 153, 135, 1),
                        ),
                      ),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocus,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (imageUrl) =>
                          _formData['imageUrl'] = imageUrl ?? '',
                      onChanged: (_imageUrl) {
                        final imageUrl = _imageUrl;

                        if (isValidImageUrl(imageUrl)) {
                          isValidUrl = true;
                          endsWithFile = true;
                        }
                      },
                      validator: (_imageUrl) {
                        final imageUrl = _imageUrl ?? '';

                        if (!isValidImageUrl(imageUrl)) {
                          return 'Informe uma Url válida!';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? const Text(
                            'Informe a Url',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : !endsWithFile && !isValidUrl
                            ? SizedBox(
                                height: 100,
                                width: 100,
                                child: FittedBox(
                                  child: Image.network(
                                    isValidImageUrl(_imageUrlController.text)
                                        ? _imageUrlController.text
                                        : '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 100,
                                width: 100,
                                child: FittedBox(
                                  child: Image.network(
                                    isValidImageUrl(_imageUrlController.text)
                                        ? _imageUrlController.text
                                        : '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
