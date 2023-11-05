import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
 final String imagePath;
  const ImageViewer({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imagePath));
  }
}
