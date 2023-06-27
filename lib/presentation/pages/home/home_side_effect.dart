sealed class HomeSideEffect {}

class OpenSharedUrl extends HomeSideEffect {
  final String url;

  OpenSharedUrl({
    required this.url,
  });
}