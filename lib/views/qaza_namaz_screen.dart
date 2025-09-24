import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/qaza_controller.dart';
import '../widget/prayer_counter_card.dart';

class HomePage extends StatelessWidget {
  final QazaController controller = Get.put(QazaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qaza Namaz Counter")),
      body: Column(
        children: [
          Expanded(

            child: ListView.builder(
              //shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: controller.prayers.length,
              itemBuilder: (context, index) {
                final prayer = controller.prayers[index];
                return Obx(() => PrayerCounterCard(
                  prayerName: prayer,
                  count: controller.counters[prayer] ?? 0,
                  onIncrement: () => controller.increment(prayer),
                  onDecrement: () => controller.decrement(prayer),
                ));
              },
            ),
          ),
          Obx(()=>Padding(padding: EdgeInsets.all(10),
          child: Text("Last Update: ${controller.lastupdated.value}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),),))
        ],
      ),
    );
  }
}
