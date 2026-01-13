//تجميع كل الدوال الي تخص الAuth زي اللوجين والSignup
import 'package:dio/dio.dart';
import 'package:food_application/core/network/api_error.dart';
import 'package:food_application/core/network/api_exceptions.dart';
import 'package:food_application/core/network/api_service.dart';
import 'package:food_application/core/utils/pref_helpers.dart';
import 'package:food_application/features/auth/data/user_model.dart';

class AuthRepo {
  APIService apiService = APIService();

  //Login
  Future<UserModel?> login(String email, String password) async {
    //Defensive programming
    // تتوقع الاخطاء قبل ان تحصل
    try {
      final response = await apiService.post('/login', {
        "email": email,
        "password": password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final code = response['code'];
        final data = response['data'];
        if (code != 200 || data == null) {
          throw ApiError(message: message);
        }
        //هذا تخيل انع بعد ما تضغط ع زر الارسال في بوست مان الي هو الرد لما يكون التسجيل صحيح شو بده يرجع
        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          await PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: "message UnExpected Error From Server");
      }
    } on DioException catch (e) {
      throw APIExceptions.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //Signup
  Future<UserModel?> signup(String name, String email, String password) async {
    try {
      final response = await apiService.post('/register', {
        'name': name,
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code);
        final data = response['data'];
        if (coder != 200 && coder != 201) {
          throw ApiError(message: message);
        }
        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          await PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: 'message UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw APIExceptions.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //Get Profile Data
  Future<UserModel?> getProfileData() async {
    try {
      final response = await apiService.get('/profile');
      return UserModel.fromJson(response["data"]);
    } on DioException catch (e) {
      APIExceptions.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  //update profile data
  Future<UserModel?> updateProfileData({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,

        if (visa != null && visa.isNotEmpty) 'Visa': visa,
        if (imagePath != null && imagePath.isNotEmpty)
          'image': await MultipartFile.fromFile(
            imagePath,
            filename: 'profile.jpg',
          ),
      });
      final response = await apiService.post('/update-profile', formData);
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code);
        if (coder != 200 && coder != 201) {
          throw ApiError(message: message);
        }
      }
    } on DioException catch (e) {
      throw APIExceptions.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  //Logout
}
