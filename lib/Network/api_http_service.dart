

import 'package:dio/dio.dart';
import 'package:dio_json_t1/model/list_user_response.dart';
import 'package:dio_json_t1/model/post_data_response.dart';
// import 'package:flutter_api_json_parse/network/response/login_response.dart';
import 'package:retrofit/http.dart';

part 'api_http_service.g.dart';


// @RestApi(baseUrl:'http://124.130.54.88/api') // Enter you base URL

@RestApi() 
abstract class ApiHttpServices {

  // factory ApiService(Dio dio, {required String baseUrl}){

  //   //_dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
  //   dio.options = BaseOptions(
  //     // receiveTimeout: 30000,
  //     // connectTimeout: 30000,
  //     contentType: 'application/json',
	//   /* If needed headers */
  //     headers: {
  //       // 'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
  //       // 'X-ApiKey': 'ZGslzIzEyMw==',
  //       'Content-Type': 'application/json'
  //     }
  //   );

  //   return _ApiService(dio,baseUrl:baseUrl);
  // }
  factory ApiHttpServices(Dio dio, {String baseUrl}) = _ApiHttpServices;

  // Login service
  @GET('/api/users?page=2') // enter your api method
  Future<ListUserResponse> login (@Body() Map<String,dynamic> body);


    // Get User List
  @GET('/api/users?page=2') // enter your api method
  Future<ListUserResponse> usersList ();

  // @POST('/posts')
  // Future<void> addPosts (@Body() PostData data);

}