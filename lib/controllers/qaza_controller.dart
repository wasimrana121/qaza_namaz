import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QazaController extends GetxController {
  final box = GetStorage();
  var selectedPrayer = RxnString();

  // List of prayer names
  final List<String> prayers = [
    "Fajar",
    "Zuhar",
    "Asar",
    "Maghrib",
    "Esha",
  ];

  // Reactive map of counters
  RxMap<String, int> counters = <String, int>{}.obs;
  var lastupdated= "".obs;

  @override
  void onInit() {
    super.onInit();

    // Load saved counters from local storage, or set defaults
    for (var prayer in prayers) {
      counters[prayer] = box.read(prayer) ?? 0;
    }
    lastupdated.value= box.read("lastUpdated")??"Never";
  }

  // Increase prayer counter
  void increment(String prayer) {
    counters[prayer] = (counters[prayer] ?? 0) + 1;
    box.write(prayer, counters[prayer]); // save instantly
    updateData();
  }

  // Decrease prayer counter (not below 0)
  void decrement(String prayer) {
    if ((counters[prayer] ?? 0) > 0) {
      counters[prayer] = counters[prayer]! - 1;
      box.write(prayer, counters[prayer]);// save instantly
      updateData();
    }
  }
  void addBulk(String prayer, int value){
    counters[prayer]= value;
    box.write(prayer, counters[prayer]);
    updateData();
  }

  // Reset all counters
  void resetAll() {
    for (var prayer in prayers) {
      counters[prayer] = 0;
      box.write(prayer, 0);
      updateData();
    }
  }
  void updateData(){
    final now= DateTime.now();
    lastupdated.value="${now.day}-${now.month}-${now.year} ${now.hour}: ${now.minute}";
    box.write("lastUpdated", lastupdated.value);
  }



}
