class SearchFactsResultResponse {
  final String value;
  final String url;
  final List<String> categories;

  SearchFactsResultResponse({
    required this.value,
    required this.url,
    required this.categories,
  });

  SearchFactsResultResponse.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        url = json['url'],
        categories = (json['categories'] as List<dynamic>)
            .map((data) => data.toString())
            .toList();
}