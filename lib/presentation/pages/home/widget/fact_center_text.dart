import 'package:flutter/material.dart';

class FactCenterText extends StatelessWidget {
  final String text;

  const FactCenterText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Center(
      child: Text(text, style: theme.textTheme.titleLarge),
    );
  }
}
