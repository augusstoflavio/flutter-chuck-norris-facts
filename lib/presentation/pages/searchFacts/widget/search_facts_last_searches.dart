import 'package:flutter/material.dart';

class SearchFactsLastSearches extends StatelessWidget {
  final List<String> lastSearches;

  const SearchFactsLastSearches({super.key, required this.lastSearches});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lastSearches.length,
      separatorBuilder: (context, index) => const SizedBox(height: 6.0),
      itemBuilder: (context, index) => Text(lastSearches[index]),
    );
  }
}
