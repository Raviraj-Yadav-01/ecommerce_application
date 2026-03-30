import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_application/core/exceptions/apps_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class ApiService {


   getApi({required String url, Map<String ,String>? mHeaders,
   bool isLoginRegister = false})async{
      Uri uri = Uri.parse(url);


      if(!isLoginRegister){
        mHeaders ??= {};
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString(AppConstants.prefUserToken) ?? "";
        mHeaders["Authentications"] = "Bearer $token";
      }

      try{
         var response = await http.get(uri, headers: mHeaders);
         return returnResponse(response);
      }on SocketException catch (e){
          throw NoInternetExceptions(msg : e.toString());
      }catch(e){
        print(e);
      }
   }


  Future<dynamic> postApi({ required String url, Map<String, dynamic>? mBody}) async {

    Uri uri = Uri.parse(url);

    try {
      var response = await http.post(uri, headers: {"Content-Type": "application/json"},body: mBody != null ? jsonEncode(mBody) : null);

      print("==== API DEBUG LOGS ====");
      print("1. URL CALL KI: $url");
      print("2. DATA BHEJA: ${mBody != null ? jsonEncode(mBody) : 'Kuch nahi bheja'}");
      print("3. STATUS CODE AAYA: ${response.statusCode}");
      print("4. SERVER KA JAWAB: ${response.body}");
      print("========================");

      return returnResponse(response);
    } on SocketException catch (e) {
      throw NoInternetExceptions(msg: e.toString());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        {
          print("Success: API Call successful");
          var data = jsonDecode(response.body);
          return data;
        }
      case 400:
        {
          throw BadRequestException( msg: "Bad Request: ${response.statusCode}",
          );
        }
      case 401:
        {
          throw UnauthorizedException( msg: "Unauthorized: ${response.statusCode}",
          );
        }
      case 404:
        {
          throw NotFoundExceptions( msg: "Not Found: ${response.statusCode}",
          );
        }

      case 500:
       default:
        {
          throw NotFoundExceptions(
            msg: "Server Error with statusCode ${response.statusCode}",);
        }
    }
  }
}
