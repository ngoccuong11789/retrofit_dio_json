import 'package:dio/dio.dart';
import 'package:dio_json_t1/http_service.dart';
import 'package:dio_json_t1/model/single_user_response.dart';
import 'package:dio_json_t1/model/user.dart';
import 'package:flutter/material.dart';

class SingleUserScreen extends StatefulWidget {
  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  late HttpService http;

  late SingleUserResponse singleUserResponse;
  late User user;

  bool isLoading = false;

  Future getUser() async {
    Response response;
    try {
      isLoading = true;

      response = await http.getRequest("/api/users/2");

      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          user = singleUserResponse.user;
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {

    http = HttpService();

    getUser();

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
          : user != null ? Container(
        width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(user.avatar),
                  Container(height: 16,),
                  Text("Hello, ${user.firstName} ${user.lastName}")
                ],
              ),
          ): Center(child : Text("No User Object")),
    );
  }
}
