import 'package:flutter/material.dart';

class LabelMenu extends StatelessWidget {
  const LabelMenu({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
