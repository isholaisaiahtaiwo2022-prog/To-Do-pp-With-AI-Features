import 'package:flutter/material.dart';

class AddTaskBar extends StatefulWidget {
  final ValueChanged<String> onAdd;
  // final String hintText;

  const AddTaskBar({
    super.key,
    required this.onAdd,
    // required this.hintText = 'Add a new Task...',
  });

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onAdd(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _submit(),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                // hintText: widget.hintText,
                filled: true,
                fillColor: const Color(0xFFFCEB8E),
                contentPadding: 
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                )
              ),
            ) 
          ),

          const SizedBox(width: 10,),

          Material(
            color: const Color(0xFFE05264),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: _submit,
              child: const Padding(padding: EdgeInsets.all(14),
              child: Icon(Icons.add, color: Colors.white,),),
            ),
          )
        ],
      ),
    );
  }
}
