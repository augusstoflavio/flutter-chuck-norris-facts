import 'package:flutter/material.dart';

class SearchFactsLastSearches extends StatelessWidget {
  final List<String> lastSearches;
  final void Function(String) onClickLastSearch;

  const SearchFactsLastSearches({
    super.key,
    required this.lastSearches,
    required this.onClickLastSearch,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lastSearches.length,
      separatorBuilder: (context, index) => const SizedBox(height: 6.0),
      itemBuilder: (context, index) {
        var search = lastSearches[index];
        return GestureDetector(
            onTap: () {
              onClickLastSearch.call(search);
            },
            child: Text(
              search,
            ),
          );
        },
    );
  }
}
