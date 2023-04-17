import 'package:NudgeBuddy/constants/colors.dart';
import 'package:NudgeBuddy/controllers/notifications.dart';
import 'package:NudgeBuddy/services/notifications.dart';
import 'package:NudgeBuddy/utils/size_config.dart';
import 'package:NudgeBuddy/views/widgets/custom_button.dart';
import 'package:NudgeBuddy/views/widgets/custom_inputfield.dart';
import 'package:NudgeBuddy/views/widgets/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// AddNotificationDialog class displays the dialog box on the screen to set a new notification in the notification page.
//==============================================================================================================================================================================
class AddNotificationDialog extends StatelessWidget {
  AddNotificationDialog({super.key});
  final cont = Get.find<NotificationCont>();
  final timeFormat = DateFormat('hh : mm  a'); // Formats the time to be displayed in the dialog box
  @override
  Widget build(BuildContext context) { // Builds the dialog box widget and styles it, as well as adding the input fields for the user to enter the notification details
    return Material(
      color: Colors.transparent,
      child: Obx(
        () => ShowLoading(
          inAsyncCall: cont.isLoading.value,
          child: Center(
            child: Container(
                height: SizeConfig.heightMultiplier * 46,
                width: SizeConfig.widthMultiplier * 85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4,
                    vertical: SizeConfig.heightMultiplier * 2),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: SizeConfig.widthMultiplier * 6),
                      Text(
                        'Set Notification',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.textMultiplier * 2),
                      ),
                      InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.cancel_outlined))
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  CustomInputField(
                      controller: cont.titleCont,
                      hintText: 'Title',
                      keyboardType: TextInputType.text),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  CustomInputField(
                    controller: cont.bodyCont,
                    hintText: 'Body',
                    keyboardType: TextInputType.text,
                    isBig: true,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Row(
                    children: [
                      Text(
                        'Set Time',
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      //TIME
                      GestureDetector(
                        onTap: () async {
                          final date = DateTime.parse(cont.selectedDate.value);
                          final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                  hour: date.hour, minute: date.minute));

                          if (selectedTime != null) {
                            final selectedDate = DateTime.utc(
                                date.year,
                                date.month,
                                date.day,
                                selectedTime.hour,
                                selectedTime.minute);
                            print(selectedDate);
                            cont.selectedDate.value = selectedDate.toString();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 3,
                              vertical: SizeConfig.heightMultiplier * 0.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  ColorConstants.primaryColor.withOpacity(0.3)),
                          child: Text(
                            timeFormat.format(
                                DateTime.parse(cont.selectedDate.value)),
                            style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.textMultiplier * 2),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  CustomButton(
                      onTap: () => NotificationService.addNotification(
                          cont.titleCont.text,
                          cont.bodyCont.text,
                          cont.selectedDate.value),
                      text: 'Set',
                      width: SizeConfig.widthMultiplier * 90)
                ])),
          ),
        ),
      ),
    );
  }
}
