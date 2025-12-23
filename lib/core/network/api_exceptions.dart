import 'package:dio/dio.dart';
import 'package:food_application/core/network/api_error.dart';

class APIExceptions {
  static ApiError handelError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    if (data is Map<String, dynamic> && data['message'] != null) {
      return ApiError(message: data['message'], statusCode: statusCode);
    }
    if(statusCode ==302){
      throw ApiError(message: 'The Email Already Taken');
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Bad Connection');
      case DioExceptionType.badResponse:
        return ApiError(message: 'Bad Response .Please Try again');
      case DioExceptionType.sendTimeout:
        return ApiError(message:"Requested Timeout .Please Try again");
      case DioExceptionType.receiveTimeout:
        return ApiError(message:'Response Timeout .Please Try again');
      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad Certificate .Please Try again');
      case DioExceptionType.cancel:
        return ApiError(message: 'Cancel . Please Try again');
      case DioExceptionType.connectionError:
        return ApiError(message: 'Connection Error . Please Try again');
      case DioExceptionType.unknown:
        return ApiError(message: 'An unexpected error occurred.Please Try again');
    }
  }
}
