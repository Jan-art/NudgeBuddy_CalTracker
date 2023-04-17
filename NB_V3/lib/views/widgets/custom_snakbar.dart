import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// CustomSnackbar class renders a custom snackbar called by the method showCustomSnackbar() 
// ===========================================================================================================================================================
class CustomSnackbar {
  static showCustomSnackbar(bool isError,String text) {
    return AnimatedSnackBar.material(
      text,
      
      type:isError? AnimatedSnackBarType.error:AnimatedSnackBarType.success
    ).show(Get.overlayContext!);
  }
}
