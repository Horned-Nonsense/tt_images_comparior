import 'package:flutter/material.dart';

import 'package:tt_images_comparior/comparison/compare_images.dart';

///Base widget for build the app
class CamperiorApp extends StatelessWidget {
  ///Passes the key to StatelessWidget
  const CamperiorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Camperior Demo',
      debugShowCheckedModeBanner: false,
      home: CompareImages(),
    );
  }
}
