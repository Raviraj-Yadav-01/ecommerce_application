import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_application/core/exceptions/apps_exception.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<dynamic> postApi({ required String url, Map<String, dynamic>? mBody}) async {

    Uri uri = Uri.parse(url);

    try {
      var response = await http.post( uri, body: mBody != null ? jsonEncode(mBody) : null);
      return returnResponse(response);
    } on SocketException catch (e) {
      throw NoInternetExceptions(msg: e.toString());
    } catch (e) {
      print(e);
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
