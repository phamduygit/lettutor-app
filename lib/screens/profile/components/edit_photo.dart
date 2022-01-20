import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor_app/data/provider/user_provider.dart';
import 'package:provider/provider.dart';
final cloudinary = CloudinaryPublic('dvhhz53rr', 'vhoajbat', cache: false);
class EditPhoto extends StatefulWidget {
  const EditPhoto({
    Key? key,
  }) : super(key: key);
  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  String imageURL = "";
  final ImagePicker _picker = ImagePicker();
  Future getImageFromGallary() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image!.path,
            resourceType: CloudinaryResourceType.Image),
      );
      setState(() {
        imageURL = response.secureUrl;
        Provider.of<UserProvider>(context, listen: false).avatar = imageURL;
      });
    } on CloudinaryException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(75.0),
          child: imageURL != ""
              ? Image.network((imageURL),
                  width: 150, height: 150, fit: BoxFit.fill)
              : Image.network(user.avatar,
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
