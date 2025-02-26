import 'package:flutter/material.dart';

class StateWithMessage extends StatelessWidget {
  const StateWithMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
