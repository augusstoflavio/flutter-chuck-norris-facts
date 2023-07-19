import 'package:chuck_norris_facts/domain/models/failure.dart';

class GenericFailure extends Failure {
  GenericFailure({
    required super.exception,
  });
}