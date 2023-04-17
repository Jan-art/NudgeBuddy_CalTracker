import 'package:NudgeBuddy/views/pages/bottom%20nav%20bar/stats/components/chart.dart';
import 'package:get/get.dart';

// Stats Controller class to store the data for the stats in the stats screen. 
//==================================================================================================================================================================

class StatsCont extends GetxController {
  RxInt highestKcalVal=0.obs;
  RxInt todayWeight=0.obs;
  RxString selectedDate = DateTime.now().toString().split(' ')[0].obs;
  Rxn<List<ChartSampleData>> calories = Rxn<List<ChartSampleData>>();
  List<ChartSampleData>? get getCalories => calories.value;
   Rxn<List<ChartSampleData>> weights = Rxn<List<ChartSampleData>>();
  List<ChartSampleData>? get getWeights => weights.value;
}
