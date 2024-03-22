import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout in connection with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 500,
          dioError.response?.data ?? '',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout in connection with API server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        } else {
          return ServerFailure(dioError.message!);
        }
      default:
        return ServerFailure(dioError.message!);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic errorData) {
    switch (statusCode) {
      case 401:
        return ServerFailure(errorData['message']);
      case 500:
        return ServerFailure('Internal server error');
      case 400:
        return ServerFailure(errorData['message']);
      case 403:
        return ServerFailure(errorData['message']);
      case 404:
        return ServerFailure('Not found');
      default:
        return ServerFailure(errorData);
    }
  }
}
