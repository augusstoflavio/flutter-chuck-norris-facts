import 'package:chuck_norris_facts/data/remote/failure/api_failure.dart';
import 'package:chuck_norris_facts/data/remote/failure/no_connection_failure.dart';
import 'package:chuck_norris_facts/domain/models/failure.dart';
import 'package:chuck_norris_facts/domain/models/generic_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HttpClient {
  final Dio dio;

  HttpClient({
    required this.dio,
  });

  Future<Either<Failure, T>> get<T>(
    String path,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic) responseHandler
  ) async {
    if (!_hasConnection()) {
      return Left(NoConnectionFailure());
    }

    try {
      var result = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return Right(responseHandler(result.data));
    } on DioException catch (e) {
      return Left(ApiFailure());
    } on Exception catch (e) {
      return Left(GenericFailure(error: e));
    }
  }

  bool _hasConnection() {
    return true;
  }
}
