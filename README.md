This project is being developed as part of my final year project for my university degree program. 

# NUDGE BUDDY

This is a nutrition tracker app built using the Flutter framework. The app helps users to keep track of their daily food intake, set dietary goals, and monitor their progress.

The project was originally conceived as a web platform. However, in view of the specific functionality requirements, it was deemed necessary to transition to mobile app development. Consequently, the project underwent several restarts until reaching this current version.


# PREVIEW IMAGES <img src="https://cdn3.emoji.gg/emojis/loading.gif" width = "22px" height="20px" alt="loading">
**Home Page**

![image](https://github.com/Jan-art/NudgeBuddy_CalTracker/assets/71454686/107d675b-732c-46a6-bb4e-c5ef60630394)



# Features

- **Email Authentication:** users can create an account, log in & log out, while their data is safely stored. 
Additionally, account passwords can be reset through email, if forgotten. 

- **Goal setting:** 
the app allows users to set dietary goals, such as weight gain, weight loss, or weight maintenace, and track their progress towards these goals.

- **TDEE  - Calculator Functionality:**  finds a user's "total daily energy expenditure" by first calculating the user's BMR using the `Mifflin-St Jeor Equation`, then multiplying it's value by the physical activity level selected by the user. Finally depending on the goal selected by the user, calories will either be added or subtracted. 

- **Meal Tracker:**  users can manually input a food item's nutrional macro values ("Carbs/Protein/Fat") and the app will determine it's caloric value. 

- **Nutritional information:**  the app displays nutritional information for the food items that have been tracked as a total sum, including a display of calories consumed and remaining calories to be met for the user's daily caloric intake goal. 

- **Weight Tracker:**  users can track changes in their weight over time. At the end of the week users will also be notified to input their weekly weight.

- **Progress Tracker:**  users can view their caloric intake over time and check whether they have been consitent with their diet.

- **Reminders:** users can set reminders to log their meals, drink water, or take their vitamins.

- **Tips:** users receive concise nutrition tips as notifications, to aid them in developing better knowledge towards improving their overall health through diet. 

- **Personalization:** the app allows users to change their goal at any time. 
 

# Technologies Used
- Flutter
- Dart
- VS-CODE
- Firebase Email Authentication
- Firebase Firestore Database



# General Setup

1 - Clone this repository.

2 - Install Flutter `https://docs.flutter.dev/get-started/install`

3 - Setup an emulator device using Android Studio's "AVD Manager"

4 - Setup a development environment/IDE

5 - Run the command `flutter pub get` in the terminal to install all the dependencies.

6 - Launch project app using the terminal command `flutter run` ---> The app will launch on a emulator device, if steps above have been perfomed correctly. 

7 - To create a executable package of the app that can be downloaded on your device run the command `Flutter Build APK`
