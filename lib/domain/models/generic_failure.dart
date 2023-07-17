import 'package:chuck_norris_facts/domain/models/failure.dart';

class GenericFailure extends Failure {
  final Exception error;

  GenericFailure({
    required this.error,
  });
}