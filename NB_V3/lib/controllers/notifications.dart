import 'package:NudgeBuddy/models/notification_model.dart';
import 'package:NudgeBuddy/services/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

// Notification Controller class to store the data for the notifications in the notification screen. Used in the NotificationScreen class.
//==================================================================================================================================================================

class NotificationCont extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleCont = TextEditingController();
  TextEditingController bodyCont = TextEditingController();
  RxString selectedDate = DateTime.now().toString().obs;
  Rxn<List<NotificationModel>> notifications = Rxn<List<NotificationModel>>();
  List<NotificationModel>? get getNotifies => notifications.value;
 
}
