import 'package:flutter/material.dart';

class SearchFactsSuggestions extends StatelessWidget {
  final List<String> suggestions;
  final void Function(String) onClickSuggestion;

  const SearchFactsSuggestions({
    super.key,
    required this.suggestions,
    required this.onClickSuggestion
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var textButtons = suggestions.map((suggestion) {
      return TextButton(
          onPressed: () {
            onClickSuggestion.call(suggestion);
          },
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
