import 'package:flutter/material.dart';

class RowContent extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const RowContent({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: "CeraPro",
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
