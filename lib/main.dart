import 'package:flutter/material.dart';

import 'package:tt_images_comparior/camperior_app.dart';

void main() {
  //Using to prevent a losing connection when ImagePicker is used
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const CamperiorApp());
}
