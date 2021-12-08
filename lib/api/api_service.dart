import 'package:flutter_login_api/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://reqres.in/api/login";

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fail to load Data");
    }
  }
}
