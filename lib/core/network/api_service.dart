//CRUD
import 'package:dio/dio.dart';
import 'package:food_application/core/constants/dio_client.dart';
import 'package:food_application/core/network/api_exceptions.dart';

class APIService {
  final DioClient _dioClient = DioClient();

  //CRUD Methods
  //GET
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return APIExceptions.handelError(e);
    }
  }

  //POST
  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return APIExceptions.handelError(e);
    }
  }

  //PUT/UPDATE
  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return APIExceptions.handelError(e);
    }
  }

  //DELETE
  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return APIExceptions.handelError(e);
    }
  }
}
