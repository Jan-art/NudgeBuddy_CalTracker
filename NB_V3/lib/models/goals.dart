import 'package:NudgeBuddy/constants/icons.dart';

// This class is used to store the data for the goals in the goal selection screen, part of the onboarding process. Used in the AuthController class.
//==================================================================================================================================================================

class GoalsModel {
  String image, title;
  GoalsModel({required this.image, required this.title});
  static List<GoalsModel> data = [
    GoalsModel(image: IconsConstants.weightGain, title: 'Weight gain'),
    GoalsModel(image: IconsConstants.weightLoss, title: 'Weight loss'),
    GoalsModel(image: IconsConstants.weightMaintain, title: 'Maintain weight'),
  ];
}
