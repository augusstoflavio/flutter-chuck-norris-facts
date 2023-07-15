import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/presentation/pages/home/home_event.dart';

sealed class HomeSideEffect {}

class OpenSharedUrl extends HomeSideEffect {
  final String url;

  OpenSharedUrl({
    required this.url,
  });
}

class NavigateToSearchScreen extends HomeSideEffect {
  NavigateToSearchScreen();
}

class ShowFailureDialog extends HomeSideEffect {
  final Failure failure;
  final HomeEvent tryAgainEvent;

  ShowFailureDialog({
    required this.failure,
    required this.tryAgainEvent,
  });
}
