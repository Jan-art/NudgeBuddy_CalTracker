
// This is the model class for the onboarding screen. It stores the data for the onboarding 1st slidable screen, which you see on entry if you are a new user. Used in the OnboardingCont class.
//==================================================================================================================================================================
class OnboardingModel {
  String title, subtitle, image;
  OnboardingModel({required this.image,required this.subtitle,required this.title});
  static List<OnboardingModel> data=  [
    OnboardingModel(
      title: 'Healthy Eating',
      subtitle: 'Maintaining good health should be the primary focus of everyone.',
      image: 'assets/images/onboarding1.png'
    ),
    OnboardingModel(
      title: 'Calorie Tracking',
      subtitle: 'Thanks to integrated tools you can track your progress.',
      image: 'assets/images/onboarding2.png'
    ),
  ];
}

