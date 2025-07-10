import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(errorMessage: "Server Connection Timeout.");
      case DioExceptionType.sendTimeout:
        return const ServerFailure(errorMessage: "Server Send Timeout.");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(errorMessage: "Server Receive Timeout.");
      case DioExceptionType.badCertificate:
        return const ServerFailure(errorMessage: "Server Bad Certificate.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure(errorMessage: "Request Canceled.");
      case DioExceptionType.connectionError:
        return const ServerFailure(errorMessage: "No Internet Connection.");
      case DioExceptionType.unknown:
        return const ServerFailure(errorMessage: "Unknown Error, Please Try Again Later.");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return const ServerFailure(errorMessage: "Request Not Found.");
    } else if (statusCode >= 500) {
      return const ServerFailure(errorMessage: "Internal Server Error, Please Try Again.");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    }
    return const ServerFailure(errorMessage: "Unknown Error, Please Try Again Later.");
  }
}
