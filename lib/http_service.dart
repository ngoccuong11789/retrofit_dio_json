import 'package:dio/dio.dart';

class HttpService{
  late Dio _dio;

  final baseUrl = "https://reqres.in/";
  final postUrl = 'https://jsonplaceholder.typicode.com/posts';

  HttpService(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    _dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    initializeInterceptors();
  }


  Future<Response> getRequest(String endPoint) async{
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;

  }

  Future<Response> postRequest(String postUrl, Object? data) async{
    Response response;
    
    try {
      response = await _dio.post(postUrl, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

    Future<Response> deleteRequest(String postURL) async{
    Response response;
   // _dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    try {
      response = await _dio.delete(postURL);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }



initializeInterceptors() {
  _dio.interceptors.add(InterceptorsWrapper(
    onError: (DioException e, ErrorInterceptorHandler handler) {
      print(e.message);
    },
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("${options.method} ${options.path}");
      handler.next(options);
    },
    onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
      print(response.data);
      // Có thể thêm tiền xử lý khác nếu cần.
      handler.next(response);
    },
  ));
}

}
