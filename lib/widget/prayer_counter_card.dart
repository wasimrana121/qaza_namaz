import 'package:flutter/material.dart';

class PrayerCounterCard extends StatelessWidget {
  final String prayerName;   // 👈 Name of the prayer
  final int count;           // 👈 Current counter value
  final VoidCallback onIncrement; // 👈 Function to increment
  final VoidCallback onDecrement; // 👈 Function to decrement

  const PrayerCounterCard({
    Key? key,
    required this.prayerName,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Prayer Name
            Text(
              prayerName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Counter & Buttons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.red),
                  onPressed: onDecrement,
                ),
                Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: onIncrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
