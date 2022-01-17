import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places/theme/palette.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({
    Key? key,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Palette.customGrayColor,
              ),
            ),
            alignment: Alignment.center,
            child: _storedImage != null
                ? Image.file(
                    _storedImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Text(
                    'Nenhuma imagem!',
                    style: TextStyle(
                      color: Palette.customDarkBlueColor,
                    ),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextButton(
              onPressed: _takePicture,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Icon(
                    Icons.camera,
                    color: Palette.customDarkBlueColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      'Tirar Foto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Palette.customDarkBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
