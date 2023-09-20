import 'package:flutter/material.dart';

class MyRadioListTile extends StatefulWidget {
  final String title;
  // final var value;
  // final var? groupValue; 
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  MyRadioListTile({
    required this.title,
    required this.isSelected,
    this.onChanged, 
    // this.value,
  });

  @override
  _CustomRadioListTileState createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<MyRadioListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = theme.primaryColor;
    final unselectedColor = Colors.white;

    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(!widget.isSelected);
      },
      onTapDown: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: widget.isSelected ? selectedColor : (_isHovered ? Colors.grey[300] : unselectedColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.grey[400]! : Colors.transparent,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}