import 'dart:convert' as convert;

import 'package:mycollage/auth/services.dart';
import 'package:http/http.dart' as http;
import 'package:mycollage/models/login_model.dart';

class APIManager{
    // ignore: prefer_typing_uninitialized_variables
    var response;
   static Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };

  Future<UserLogin> getLogin(_map) async{
    var url= Uri.parse(Services().baseUrl1);
    try{
      response= await http.post(url,headers:headers,body: _map);
    } catch(e){};
    
  return UserLogin.fromJson(convert.jsonDecode(response.body.toString()));
  }
  
}

