import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static final emptyAmountSnackbar = SnackBar(
    duration: const Duration(milliseconds: 500),
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.fixed,
    showCloseIcon: false,
    content: AwesomeSnackbarContent(
        inMaterialBanner: true,
        title: 'Amount is empty',
        message: 'Please enter your amount',
        contentType: ContentType.warning),
  );


  static final successSnackBar =  SnackBar(
    duration: const Duration(milliseconds: 500),
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.fixed,
    showCloseIcon: false,
    content: AwesomeSnackbarContent(
        inMaterialBanner: true,
        title: 'Great',
        message: 'Your Transaction Added Successfully',
        contentType: ContentType.success),
  );
}
