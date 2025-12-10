//بيستقبل كود الخطا والمسج شو الي حصل
//حنستقبل اي ايرور يجي من السيرفر عشان فلاتر لازم تستقبل JSon بالطريقة هذه لازم اعمل هذا الكلاس
class ApiError {
  //ضرورية تيجي
  final String message;
  //مش شرط يجي
  final int? statusCode;
  ApiError({required this.message, this.statusCode });
  @override
  String toString(){
    return message;
  }

}