import 'package:chuck_norris_facts/domain/models/failure.dart';

class NoConnectionFailure extends Failure {
  const NoConnectionFailure() : super(exception: null);
}