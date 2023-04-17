import 'package:cloud_firestore/cloud_firestore.dart';

// Constructor initializes the variables to null. MealModel is used in the MealService class to store the data for the meals.
//======================================================
class MealModel {
  String? id, title, quantity, createdAt;
  num? carbs, proteins, fats, kcal;
  String? type;
  MealModel(
      {this.carbs,
      this.createdAt,
      this.fats,
      this.id,
      this.type,
      this.kcal,
      this.proteins,
      this.quantity,
      this.title});

  // This method extracts the data from the database and sets the values for the variables. Used in the MealService class.
  
  MealModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    title = doc['Title'];
    type = doc["Type"];
    quantity = doc['Quantity'];
    createdAt = doc['CreatedAt'];
    carbs = doc['Carbs'];
    proteins = doc['Protein'];
    fats = doc['Fats']; 
    kcal = doc['Kcal'];
  }
}
