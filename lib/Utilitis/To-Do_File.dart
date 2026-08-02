import 'package:flutter/material.dart';
class todoTile extends StatelessWidget {
  const todoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Row(
          children: [

            // Check Box
            // Checkbox(value: value, onChanged: onChanged),

            Text("Make Tutorial"),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}