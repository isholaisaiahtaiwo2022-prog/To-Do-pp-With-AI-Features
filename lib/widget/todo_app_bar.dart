import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoAppBar extends StatelessWidget {
  final String title;
  const TodoAppBar({super.key, this.title = 'TO DO'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF7D842),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // @override
  // Size get PreferredSize => const Size.fromHeight(kToolbarHeight);
}
