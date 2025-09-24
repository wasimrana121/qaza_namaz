import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaza_namaz/controllers/theme_controller.dart';
import '../controllers/qaza_controller.dart';

class SettingsPage extends StatelessWidget {
  final QazaController controller = Get.find<QazaController>();


  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [

          // 🔄 Reset All Counters
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.red),
            title: const Text("Reset All Qaza Counts"),
            subtitle: const Text("This will set all prayer counts to 0"),
            onTap: () {
              Get.defaultDialog(
                title: "Confirm Reset",
                middleText: "Are you sure you want to reset all counts?",
                textCancel: "Cancel",
                textConfirm: "Reset",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller.resetAll();
                  Get.back();
                  Get.snackbar(
                    "Reset Done",
                    "All Qaza counts have been cleared",
                    snackPosition: SnackPosition.TOP,
                  );
                },
              );
            },
          ),

          const Divider(),

          // ➕ Bulk Add Qaza Prayers
          ListTile(
            leading: const Icon(Icons.playlist_add, color: Colors.green),
            title: const Text("Add Prayers in Bulk"),
            subtitle: const Text("Quickly add multiple Qaza prayers at once"),
            onTap: () {
              _showBulkAddDialog(context);
            },
          ),

          const Divider(),

          // ℹ️ About App
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About App"),
            subtitle: const Text("Qaza Namaz Counter App built with Flutter"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Qaza Namaz Counter",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.mosque, size: 40),
                children: [
                  const Text(
                    "This app helps you keep track of your pending (Qaza) prayers "
                        "and provides stats with bar & pie charts.\n\n"
                        "Built with Flutter & GetX.",
                  ),
                ],
              );
            },
          ),

          Divider(),
    Obx(() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
      "Choose Theme",
      style: Theme.of(context).textTheme.titleLarge,
      ),
    ),
    const SizedBox(height: 12),

    // Radio List for theme selection
    ...themeController.themes.keys.map((themeName) {
    return RadioListTile<String>(
    title: Text(themeName),
    value: themeName,
    groupValue: themeController.selectedTheme.value,
    onChanged: (newValue) {
    if (newValue != null) {
    themeController.setTheme(newValue);
    }
    },
    );
    }).toList(),
    ],
    ))

        ],
      ),
    );
  }

  void _showBulkAddDialog(BuildContext context) {
    final controller = Get.find<QazaController>();

    final Map<String, TextEditingController> textControllers = {
      for (var prayer in controller.prayers) prayer: TextEditingController(),
    };

    Get.dialog(
      AlertDialog(
        title: const Text("Bulk Add Prayers"),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6, // limit height
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.prayers.map((prayer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(child: Text(prayer)), // <-- Expanded avoids overflow
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          controller: textControllers[prayer],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              bool added = false;

              for (var prayer in controller.prayers) {
                final text = textControllers[prayer]!.text;
                final int? value = int.tryParse(text);

                if (value != null && value > 0) {
                  controller.addBulk(prayer, value);
                  added = true;
                }
              }

              if (added) {
                Get.back();
                Get.snackbar(
                  "Success",
                  "Prayers added in bulk",
                  snackPosition: SnackPosition.BOTTOM,
                );
              } else {
                Get.snackbar(
                  "Error",
                  "Please enter at least one valid number",
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }


}
