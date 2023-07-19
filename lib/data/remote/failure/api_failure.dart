import 'package:chuck_norris_facts/domain/models/failure.dart';

class ApiFailure extends Failure {
  final int apiErrorCode;
  final String apiErrorMessage;

  ApiFailure({
    required this.apiErrorCode,
    required this.apiErrorMessage,
    required super.exception
  });
}