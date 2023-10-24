import 'package:dio/dio.dart' as dio;
import 'package:dio_json_t1/model/list_user_response.dart';
import 'package:dio_json_t1/model/user.dart';
import 'package:flutter/material.dart';

import '../Network/api_services.dart';
import '../http_service.dart';

class ListUserScreen extends StatefulWidget {
  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  bool isLoading = false;

  late HttpService http;

  late ListUserResponse listUserResponse;

  late List<User> users;

  Future getListUser() async {
    // Response response;
    // try {
    //   isLoading = true;

    //   response = await http.getRequest("/api/users?page=2");

    //   isLoading = false;

    //   if (response.statusCode == 200) {
    //     setState(() {
    //       listUserResponse = ListUserResponse.fromJson(response.data);
    //       users = listUserResponse.users;
    //     });
    //   } else {
    //     print("There is some problem status code not 200");
    //   }
    // } on Exception catch (e) {
    //   isLoading = false;
    //   print(e);
    // }

    ApiServices apiService = await ApiServices(dio.Dio(), baseUrl: http.baseUrl);

    try {
        final response = await apiService.usersList();

    print('${response.toJson()}');
        setState(() {
          listUserResponse = response;
          //users = response.users;
        });

    } on Exception catch (e) {
      print(e);
    }
  }

  // Future<void> addPosts(title, body) async {
  //   const postUrl = 'https://jsonplaceholder.typicode.com/posts';
  //   final data = {
  //     "title": title,
  //     "body": body,
  //     "userId": 1,
  //   };
  //   Response response;
  //   try {
  //     response = await http.postRequest(postUrl, data);

  //     debugPrint('post : ${response.data}');
  //     debugPrint('post : ${response.statusMessage}');

  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  //   Future<void> deletePost(postId) async {
  //   var postUrl = 'https://jsonplaceholder.typicode.com/posts/$postId';

  //   Response response;
  //   try {
  //     response = await http.deleteRequest(postUrl);

  //     debugPrint('post : ${response.data}');
  //     debugPrint('message : ${response.statusMessage}');
  //   } catch (e) {
  //     debugPrint('exception $e');
  //   }
  // }

  @override
  void initState() {
    http = HttpService();
    //users = List<User>();
    users = [User(0, "", "", "", "")];
    listUserResponse = ListUserResponse(0, 0, 0, 0, users);
    //listUserResponse = ListUserResponse(0, 0, 0, 0, users);
   getListUser();
    // addPosts("title 2", "body 2");
    // deletePost(1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Single user"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : listUserResponse.users != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final user = listUserResponse.users[index];

                    return ListTile(
                      title: Text(user.firstName),
                      leading: Image.network(user.avatar),
                      subtitle: Text(user.email),
                    );
                  },
                  itemCount: listUserResponse.users.length,
                )
              : Center(
                  child: Text("No User Object"),
                ),
    );
  }
}
