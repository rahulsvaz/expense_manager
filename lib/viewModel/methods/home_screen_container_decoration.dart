import 'package:flutter/material.dart';
  BoxDecoration homeScreenContainerDecoration() {
    return const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(245, 246, 229, 1),
                Color.fromRGBO(248, 237, 216, 0)
              ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)));
  }