import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final Function(String) onAddItem;

  const AddItemDialog({super.key, required this.onAddItem});

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          hintText: 'Enter item name',
        ),
        maxLines: null,
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            final itemName = _textEditingController.text;
            if (itemName.isNotEmpty) {
              widget.onAddItem(itemName);
            }
          },
        ),
      ],
    );
  }
}
