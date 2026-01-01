//handle لكل حاجة بتخص باكدج الdio
import 'package:dio/dio.dart';
import 'package:food_application/core/utils/pref_helpers.dart';

class DioClient {
  //الكلاس هذا بنحط فيه الحاجات المعينة الي انا عايزه يبعتها مع كل فانكشن ان بع=نادي فيها على API
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  /*
token :
   لازم ارسله بفانكشن كتير جدا علشان السيرفر يعرف انه الريكوست ده بتاع الشخص ده
   يعتبر زي كرت دخول او بصمة بالزبط
   بيفرق شخص من شخص وهيك الباك بيفهم التفرقة بين الاشخاص
   لازم يكون موجود لانه لو مش موجود هضل اطلب كل اغراض كل شخص حضل ابعت اله ايميل وباسورد الشخص في كل طلب
 */
  DioClient() {
    //هذه مهمة جدا
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler)async {
          final token = await PrefHelpers.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
