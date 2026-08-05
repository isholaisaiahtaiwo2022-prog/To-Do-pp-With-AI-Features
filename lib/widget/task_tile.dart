import 'package:flutter/material.dart';
import 'package:to_doapp/models/task.dart';
// import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onDelete;


  const TaskTile({super.key,
  required this.task,
  required this.onChanged,
  required this.onDelete
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8),

      decoration: BoxDecoration(
        color: Color(0xFFFCEB8E),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Checkbox(value: task.isDone,
          activeColor: Colors.black87, 
          onChanged: onChanged,),

          Expanded(
            child: Text(
              task.title,
              style: TextStyle(
                color: Colors.black87,
                decoration: task.isDone? TextDecoration.lineThrough: TextDecoration.none
              ),
            ) 
          ),


          if (onDelete != null)
          IconButton(onPressed: onDelete
          , icon: Icon( Icons.close,
          size: 18, color: Colors.black45,))
        ],
      ),
    );
  }
}
