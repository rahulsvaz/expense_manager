import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
 final String imagePath;
  const ViewImage({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(imagePath);
  }
}
