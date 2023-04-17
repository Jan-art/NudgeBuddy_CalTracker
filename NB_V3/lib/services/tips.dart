import 'dart:math';

import 'package:NudgeBuddy/constants/tips.dart';
import 'package:NudgeBuddy/services/local_notifications.dart';

// This class is used to randomly select a tip from the tipsData list and send a notification to the user when the app is opened. 
// ===================================================================================================================================================================
class TipsService {
  static sendDailyTipNotification() {
    Random rand = Random();
      LocalNotificationsService().showNotification(
          DateTime.now().add(const Duration(seconds: 10)), //Delay of 10 seconds
          99,
          '🫶 Daily Nutrition Tip',
          tipsData[rand.nextInt(24)],
          false).then((value) => print('TIP NOTIFICATION WILL COME'));
    
  }
  
}
