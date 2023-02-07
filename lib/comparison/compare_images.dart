import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///Class that get 2 images from phone gallery and compare they
class CompareImages extends StatefulWidget {
  ///const constructor
  const CompareImages();

  @override
  _CompareImagesState createState() => _CompareImagesState();
}

class _CompareImagesState extends State<CompareImages> {
  int diffCounter = 0;
  double diffPercent = 0.0;
  static const width = 240.0;
  static const height = 240.0;
  File? _image1;
  File? _image2;

  Future getImage1() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image1 = File(image!.path);
    });
  }

  Future getImage2() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image2 = File(image!.path);
    });
  }

  //Compare images byte by byte
  String compareImages(File? image1, File? image2) {
    if (image1 != null && image2 != null) {
      final bytes1 = image1.readAsBytesSync();
      final bytes2 = image2.readAsBytesSync();

      if (bytes1.length == bytes2.length) {
        for (int i = 0; i < bytes1.length; i++) {
          if (bytes1[i] != bytes2[i]) {
            diffCounter++;
          }
          if (diffCounter > 0 && i == bytes1.length - 1) {
            diffPercent = diffCounter / bytes1.length;
            return 'Images are not same. '
                'Difference percent: ${diffPercent.round()}%';
          }
        }

        return 'Images are same';
      } else {
        return 'Images have different sizes';
      }
    }
    return 'Two images not selected';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getImage1,
              child: const Text(
                'Select First Image',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: getImage2,
              child: const Text(
                'Select Second Image',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            if (_image1 != null)
              const Text(
                'First image:',
                style: TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 16),
            if (_image1 != null)
              Image.file(
                _image1!,
                width: width,
                height: height,
              ),
            const SizedBox(height: 20),
            if (_image2 != null)
              const Text(
                'Second image:',
                style: TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 16),
            if (_image2 != null)
              Image.file(
                _image2!,
                width: width,
                height: height,
              ),
            const SizedBox(height: 20),
            Text(
              compareImages(_image1, _image2),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
