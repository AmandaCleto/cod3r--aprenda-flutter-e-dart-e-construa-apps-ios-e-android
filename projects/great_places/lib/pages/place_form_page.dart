import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/theme/palette.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({Key? key}) : super(key: key);

  @override
  _PlaceFormPageState createState() => _PlaceFormPageState();
}

class _PlaceFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage as File,
      _pickedPosition as LatLng,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Lugar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 10),
                    ImageInput(onSelectImage: _selectImage),
                    const SizedBox(height: 10),
                    LocationInput(onSelectPosition: _selectPosition)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: _isValidForm()
            ? Palette.customLightGreenColor
            : Palette.customGrayColor,
        child: InkWell(
          onTap: _isValidForm() ? _submitForm : null,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Palette.customDarkBlueColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Adicionar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.customDarkBlueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
