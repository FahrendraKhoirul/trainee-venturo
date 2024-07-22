class ResponseApiModel<T> {
  final bool success;
  int? statusCode;
  List<String>? errors;
  T data;

  ResponseApiModel(
      {required this.success,
      this.statusCode,
      this.errors,
      required this.data});
}
