import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({
    Key? key,
  }) : super(key: key);
  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  String imageURI = "";
  final ImagePicker _picker = ImagePicker();
  Future getImageFromGallary() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(75.0),
          child: imageURI != ""
              ? Image.file(File(imageURI),
                  width: 150, height: 150, fit: BoxFit.fill)
              : Image.asset('assets/images/avatar.jpeg',
                  width: 150, height: 150, fit: BoxFit.fill),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ElevatedButton(
            onPressed: getImageFromGallary,
            child: const Icon(Icons.edit),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              // padding: EdgeInsets.all(),
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
