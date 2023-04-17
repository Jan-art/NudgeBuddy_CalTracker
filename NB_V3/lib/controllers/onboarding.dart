import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

// Onboarding Controller class to store the data for the onboarding screen. Used in the OnboardingScreen class.
//==================================================================================================================================================================

class OnboardingCont extends GetxController {
  RxInt currentPage = 0.obs;
  Rxn<PageController> pageCont = Rxn<PageController>();

  @override
  void onInit() {
    super.onInit();
    pageCont.value = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    super.onClose();
    pageCont.value!.dispose();
  }
}
