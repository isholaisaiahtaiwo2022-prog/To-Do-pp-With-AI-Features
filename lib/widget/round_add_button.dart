import 'package:flutter/material.dart';

class RoundedAddButton extends StatelessWidget {
  final VoidCallback onpressed;
  
  const RoundedAddButton({super.key,
  required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onpressed,
        backgroundColor: const Color(0xFFF7C948),
        child: Icon(Icons.add, color: Colors.black87,),
    );
  }
}
