import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lomaTV/core/utils/assets.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({super.key});

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {

  File? imageFile;

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 80,
          child: imageFile != null
              ? CircleAvatar(
                  radius: 77,
                  backgroundImage: FileImage(imageFile!),
                )
              : const CircleAvatar(
                  radius: 77,
                  backgroundImage: AssetImage(AssetsData.noProfileImage),
                ),
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.black,
          child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                selectImage();
              }),
        ),
      ],
    );
  }
}
