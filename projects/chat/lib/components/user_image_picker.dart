import 'dart:io';
import 'package:flutter_boring_avatars/flutter_boring_avatars.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final String? name;
  final void Function(File image) onImagePick;

  const UserImagePicker({
    Key? key,
    this.name,
    required this.onImagePick,
  }) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      widget.onImagePick(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
              child: _image != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(_image!),
                    )
                  : SizedBox(
                      width: 120,
                      height: 120,
                      child: AnimatedBoringAvatars(
                        duration: const Duration(milliseconds: 300),
                        name: widget.name ?? 'default',
                        colors: Palette.beanColors,
                        type: BoringAvatarsType.beam,
                      ),
                    ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: Material(
                color: Palette.customLightGreenColor,
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  highlightColor: Colors.white10,
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: _pickImage,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Icon(
                      Icons.mode_edit_outline,
                      color: Palette.customLightColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              child: Material(
                color: Palette.customLightGreenColor,
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  highlightColor: Colors.white10,
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () => setState(() {
                    _image = null;
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Icon(
                      Icons.tag_faces_rounded,
                      color: Palette.customLightColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
