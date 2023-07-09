import 'package:flutter/material.dart';

class SearchFactsSuggestions extends StatelessWidget {
  final List<String> suggestions;

  const SearchFactsSuggestions({super.key, required this.suggestions});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var textButtons = suggestions.map((suggestion) {
      return TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.primaryContainer,
          ),
          child: Text(suggestion)
      );
    }).toList();

    return Wrap(
      runSpacing: 4.0,
      spacing: 6.0,
      children: textButtons,
    );
  }
}
