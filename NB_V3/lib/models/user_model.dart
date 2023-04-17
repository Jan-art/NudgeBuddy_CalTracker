import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Constructor initializes the variables to null. This is used in the UserService class for the user's profile. 
//=================================================================================================================
class UserModel {
  int? goalIndex, activityLevelIndex, genderIndex,age;
  num? weight, height,weightGoal;
  bool? allowNotifications;
  String? id, username, email, weightUnit, heightUnit, createdAt;
  UserModel(
      { this.activityLevelIndex,
       this.createdAt,
       this.email,
       this.genderIndex,
       this.goalIndex,
       this.height,
       this.allowNotifications,
       this.weightGoal,
       this.heightUnit,
       this.age,
       this.username,
       this.weight,
       this.id,
       this.weightUnit});
  
  // This method extracts the data from the database and sets the values for the variables.
  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    goalIndex = doc['GoalIndex'];
    activityLevelIndex = doc['ActivityLevelIndex'];
    username = doc['Username'];
    email = doc['Email'];
    allowNotifications=doc['AllowNotifications'];
    weightGoal=doc['WeightGoal'];
    genderIndex = doc['GenderIndex'];
    weight = doc['Weight'];
    age=doc['Age'];
    weightUnit = doc['WeightUnit'];
    height = doc['Height'];
    heightUnit = doc['HeightUnit'];
    createdAt = doc['CreatedAt'];
  }
}
